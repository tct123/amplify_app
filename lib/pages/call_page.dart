import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:amplify_app/pages/home_page.dart';
import 'package:amplify_app/pages/join_call_page.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  WebSocketChannel? _channel;
  bool _isConnecting = true;
  bool _isCallActive = false;
  bool _isLeavingCall = false;
  String? _callId;
  String? _matchedUserName;
  String? _matchedUserProfilePicture;
  final bool _debug = true;

  final List<String> options = [
    "go skiing or snorkelling?",
    "eat pizza or burgers?",
    "travel to the mountains or the beach?",
    "read a book or watch a movie?",
    "stay in or go out?"
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _connectWebSocket();
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }

  void safePrint(String msg) {
    if (_debug) print('${DateTime.now().toIso8601String()}: $msg');
  }

  Future<void> _connectWebSocket() async {
    safePrint('→ Initializing WebSocket');
    try {
      _channel?.sink.close();
      _channel = WebSocketChannel.connect(
        Uri.parse('wss://gxwn07m3ma.execute-api.eu-north-1.amazonaws.com/prod'),
      );
      safePrint('→ WebSocket connected');

      // clear state shortly after connect
      Future.delayed(const Duration(milliseconds: 200), _sendClearState);

      _channel!.stream.listen(
        _onMessage,
        onError: (e) {
          safePrint('WebSocket error: $e');
          _reconnect();
        },
        onDone: () {
          safePrint('WebSocket closed');
          _reconnect();
        },
      );
    } catch (e) {
      safePrint('Error connecting WebSocket: $e');
      _reconnect();
    }
  }

  void _reconnect() {
    _channel = null;
    setState(() => _isConnecting = true);
    Future.delayed(const Duration(seconds: 5), _connectWebSocket);
  }

  Future<void> _send(Map<String, dynamic> msg) async {
    final payload = jsonEncode(msg);
    safePrint('→ Sending: $payload');
    _channel?.sink.add(payload);
  }

  void _sendClearState() async {
    final user = await Amplify.Auth.getCurrentUser();
    await _send({
      'action': 'clearState',
      'userId': user.userId,
    });
  }

  Future<void> _onMessage(dynamic raw) async {
    safePrint('← Received raw: $raw');
    final data = jsonDecode(raw as String) as Map<String, dynamic>;
    safePrint('← Parsed: $data');

    switch (data['action']) {
      case 'stateCleared':
        setState(() => _isConnecting = false);
        _joinMatchmaking();
        return;
      case 'leftCall':
        if (!mounted) return;
        setState(() {
          _isCallActive = false;
          _isLeavingCall = false;
          _callId = null;
          _matchedUserName = null;
          _matchedUserProfilePicture = null;
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (_) => false,
        );
        return;
      default:
        if (data.containsKey('callId')) {
          final other = data['otherUser'] as Map<String, dynamic>;
          setState(() {
            _callId = data['callId'] as String;
            _matchedUserName = other['name'] as String;
            _matchedUserProfilePicture = other['profilePictureUrl'] as String?;
            _isCallActive = true;
          });
          return;
        }
    }
  }

  void _joinMatchmaking() {
    if (_isCallActive || _isLeavingCall) return;
    setState(() => _callId = null);
    Future.delayed(const Duration(seconds: 1), () async {
      final user = await Amplify.Auth.getCurrentUser();
      final timestamp = DateTime.now()
          .toUtc()
          .toIso8601String()
          .replaceAll(RegExp(r'\.\d{6}Z\$'), 'Z');
      await _send({
        'action': 'joinMatchmaking',
        'userId': user.userId,
        'timestamp': timestamp,
      });
    });
  }

  Future<void> _leaveCall() async {
    if (_callId == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (_) => false,
      );
      return;
    }

    setState(() => _isLeavingCall = true);
    await Future.delayed(const Duration(seconds: 1));

    final user = await Amplify.Auth.getCurrentUser();
    await _send({
      'action': 'leaveCall',
      'userId': user.userId,
      'callId': _callId,
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted && _isLeavingCall) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (_) => false,
        );
      }
    });
  }

  void _nextOption() => setState(() => currentIndex = (currentIndex + 1) % options.length);
  void _prevOption() => setState(() => currentIndex = (currentIndex - 1 + options.length) % options.length);

  @override
  Widget build(BuildContext context) {
    // Connecting
    if (_isConnecting) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Leaving
    if (_isLeavingCall) {
      return Scaffold(
        body: Center(
          child: Text(
            'Leaving call...',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }
        // Wu Wei quote screen
    if (!_isCallActive) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
              (_) => false,
            );
          }),
          title: const Text(''),
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left:24.0, right: 24.0, bottom:24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('searching', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                const SizedBox(height: 16),
                CircularProgressIndicator(color: Theme.of(context).primaryColor),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  child: Text(
                    _callId == null
                        ? '''Wu wei (無為)
Means “effortless action”. The art of not forcing anything. You are who you are and they will be who they will be. You like what you like and they will like what they will like. You might not be what they like and they might not be what you like. Some people like cats, some people like dogs. You can’t be a cat and a dog. You can’t be red and blue.

Look for the path of least resistance. The conversation of least resistance.
With the right person, it’s easier, feels more natural, less forced.

Don’t try to be someone else's match, try to find yours.'''
                        : 'Failed to join call. Try again.',
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Active call UI
    return Scaffold(
      body: Stack(
        children: [
          if (_matchedUserProfilePicture != null)
            Positioned.fill(
              child: Image.network(
                _matchedUserProfilePicture!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(
                  child: Text(
                    'Image load error',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                loadingBuilder: (_, w, lp) => lp == null
                    ? w
                    : Center(
                        child: CircularProgressIndicator(
                          value: lp.expectedTotalBytes != null
                              ? lp.cumulativeBytesLoaded / (lp.expectedTotalBytes!)
                              : null,
                        ),
                      ),
              ),
            ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              _matchedUserName ?? '',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: _leaveCall,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text('Leave', style: TextStyle(color: Colors.white)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: JoinChannelAudio(channelID: _callId!),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Would you rather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(icon: Icon(Icons.arrow_left), onPressed: _prevOption),
                          Expanded(
                            child: Text(
                              options[currentIndex],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.arrow_right), onPressed: _nextOption),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

