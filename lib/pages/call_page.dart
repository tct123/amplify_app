// lib/pages/call_page.dart

import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
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
  String? _callId;
  String? _matchedUserName;
  String? _matchedUserProfilePicture;
  Timer? _debounceTimer;
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

    // DEBUG: force joinMatchmaking after 2 seconds
    Future.delayed(const Duration(seconds: 2), () async {
      final user = await Amplify.Auth.getCurrentUser();
      final timestamp = DateTime.now().toUtc().toIso8601String().replaceAll(RegExp(r'\.\d{6}Z$'), 'Z');
      final msg = jsonEncode({
        'action': 'joinMatchmaking',
        'userId': user.userId,
	'timestamp': timestamp,
      });
      _channel?.sink.add(msg);
      safePrint('DEBUG: forced joinMatchmaking → $msg');
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _channel?.sink.close();
    super.dispose();
  }

  void safePrint(String message) {
    if (_debug) print('${DateTime.now().toIso8601String()}: $message');
  }

  void _connectWebSocket() {
    _channel?.sink.close();
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://gxwn07m3ma.execute-api.eu-north-1.amazonaws.com/prod/'),
    );
    _channel!.stream.listen(
      _onWebSocketMessage,
      onError: _onWebSocketError,
      onDone: _onWebSocketDone,
    );
    _sendClearState();
  }

  void _send(Map<String, dynamic> msg) {
    final jsonMsg = jsonEncode(msg);
    _channel?.sink.add(jsonMsg);
    safePrint('Sent: $jsonMsg');
  }

  void _sendClearState() {
    Amplify.Auth.getCurrentUser().then((user) {
      _send({'action': 'clearState', 'userId': user.userId});
    }).catchError((e) {
      safePrint('Error sending clearState: $e');
    });
  }

  Future<void> _onWebSocketMessage(dynamic message) async {
    safePrint('Received: $message');
    final data = jsonDecode(message as String) as Map<String, dynamic>;
    safePrint('Current state: _isConnecting=$_isConnecting, _isCallActive=$_isCallActive');

    if (data['message'] == 'Forbidden') return;

    // 1) clearState ack
    if (data['action'] == 'stateCleared') {
      safePrint('Handling stateCleared');
      setState(() => _isConnecting = false);
      _joinMatchmaking();
      return;
    }

    // 2) match payload (we now expect callId + otherUser map)
    if (data.containsKey('callId')) {
      safePrint('Handling match with callId: $data["callId"]');
      final callId = data['callId'] as String;
      final other = data['otherUser'] as Map<String, dynamic>;

      // new: read the presigned URL directly
      final otherName = other['name'] as String;
      final imageUrl = other['profilePictureUrl'] as String?;

      safePrint('Using presigned URL: $imageUrl');

      setState(() {
        _callId = callId;
        _matchedUserName = otherName;
        _matchedUserProfilePicture = imageUrl;
        _isCallActive = true;
        _isConnecting = false;
        safePrint('Updated state → _isConnecting=$_isConnecting, _isCallActive=$_isCallActive');
      });
      return;
    }

    // 3) leftCall
if (data['action'] == 'leftCall') {
  safePrint('Handling leftCall');
  setState(() {
    _isCallActive = false;
    _isConnecting = true;
    _callId       = null;
    _matchedUserName = null;
    _matchedUserProfilePicture = null;
  });
  _joinMatchmaking();
  return;
}

    safePrint('Unhandled action: ${data['action']}');
  }

  void _onWebSocketError(error) {
    safePrint('WebSocket error: $error');
    Future.delayed(const Duration(seconds: 5), _connectWebSocket);
  }

  void _onWebSocketDone() {
    safePrint('WebSocket closed');
    Future.delayed(const Duration(seconds: 5), _connectWebSocket);
  }

void _joinMatchmaking() {
  print("Call is active: ${_isCallActive.toString()}");
  if (_isCallActive) return;
  setState(() {
    _callId = null;
    _matchedUserName = null;
    _matchedUserProfilePicture = null;
  });

  Future.delayed(const Duration(seconds: 2), () async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final timestamp = DateTime.now().toUtc().toIso8601String().replaceAll(RegExp(r'\.\d{6}Z$'), 'Z');
      final msg = jsonEncode({
        'action': 'joinMatchmaking',
        'userId': user.userId,
        'timestamp': timestamp,
      });
      await _sendMessage(msg); // Use the helper method
    } catch (e) {
      safePrint('Error in joinMatchmaking: $e');
    }
  });
}

Future<void> _leaveCall() async {
  final callId = _callId;
  if (callId == null) {
    safePrint('❌ leaveCall: no active call to leave');
    return;
  }

  try {
    final user = await Amplify.Auth.getCurrentUser();
    final payload = jsonEncode({
      'action': 'leaveCall',
      'userId': user.userId,
      'callId': callId,
    });
    await _sendMessage(payload); // Use the helper method
    setState(() {
      _isCallActive = false;
      _isConnecting = true;
    });
  } catch (e) {
    safePrint('Error in leaveCall: $e');
  }
}
Future<void> _sendMessage(String payload) async {
  try {
    if (_channel == null) {
      safePrint('WebSocket channel is null, reconnecting...');
    }
    await _channel?.ready;
    safePrint('Sending payload: $payload');
    _channel?.sink.add(payload);
  } catch (e) {
    safePrint('WebSocket error: $e');
  }
}  void _nextOption() => setState(
      () => currentIndex = (currentIndex + 1) % options.length);
  void _previousOption() => setState(() =>
      currentIndex = (currentIndex - 1 + options.length) % options.length);

  @override
  Widget build(BuildContext context) {
    if (_isConnecting) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      );
    }
    if (!_isCallActive) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            _callId == null ? 'Finding Match...' : 'Failed to join call. Try again.',
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // show the presigned image as background
          if (_matchedUserProfilePicture != null)
            Positioned.fill(
              child: Image.network(
                _matchedUserProfilePicture!,
                fit: BoxFit.cover,
                errorBuilder: (c, e, st) => Center(child: Text('Image load error', style: TextStyle(color: Colors.white))),
                loadingBuilder: (c, w, lp) => lp == null
                    ? w
                    : Center(child: CircularProgressIndicator(value: lp.expectedTotalBytes != null
                        ? lp.cumulativeBytesLoaded / (lp.expectedTotalBytes ?? 1)
                        : null)),
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
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
              child: const Text(
                'Leave',
                style: TextStyle(color: Colors.white),
              ),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Would you rather',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.arrow_left),
                              onPressed: _previousOption),
                          Expanded(
                            child: Text(
                              options[currentIndex],
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.arrow_right),
                              onPressed: _nextOption),
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

