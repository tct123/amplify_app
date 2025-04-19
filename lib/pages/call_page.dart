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
  WebSocketChannel? _webSocketChannel;
  bool _isJoiningMatchmaking = false;
  bool _isCallActive = false;
  String? _callId;
  String? _matchedUserName;
  String? _matchedUserProfilePicture;
  Timer? _debounceTimer;
  final bool _debug = true;

  // "Would you rather" options
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
    _debounceTimer?.cancel();
    _webSocketChannel?.sink.close();
    super.dispose();
  }

  void safePrint(String message) {
    if (_debug) {
      print('${DateTime.now().toIso8601String()}: $message');
    }
  }

  void _connectWebSocket() {
    if (!mounted) return;
    try {
      _webSocketChannel?.sink.close();
      _webSocketChannel = WebSocketChannel.connect(
        Uri.parse('wss://gxwn07m3ma.execute-api.eu-north-1.amazonaws.com/prod/'),
      );
      safePrint('WebSocket connected');
      _webSocketChannel!.stream.listen(_onWebSocketMessage,
        onError: _onWebSocketError,
        onDone: _onWebSocketDone,
      );
      _joinMatchmaking();
    } catch (e) {
      safePrint('WebSocket connection error: $e');
      Future.delayed(Duration(seconds: 5), _connectWebSocket);
    }
  }

  void _onWebSocketMessage(dynamic message) {
    safePrint('Received: $message');
    final data = jsonDecode(message as String);
    if (data['action'] == 'matchFound') {
      setState(() {
        _callId = data['callId'] as String;
        _matchedUserName = data['matchedUser']['name'] as String;
        _matchedUserProfilePicture = data['matchedUser']['profilePicture'] as String;
        _isCallActive = true;
      });
      safePrint('Matched with $_matchedUserName');
    }
  }

  void _onWebSocketError(error) {
    safePrint('WebSocket error: $error');
    Future.delayed(Duration(seconds: 5), _connectWebSocket);
  }

  void _onWebSocketDone() {
    safePrint('WebSocket closed');
    Future.delayed(Duration(seconds: 5), _connectWebSocket);
  }

  void _joinMatchmaking() {
    if (_isJoiningMatchmaking || _isCallActive) return;
    _debounceTimer = Timer(Duration(seconds: 2), () {
      Amplify.Auth.getCurrentUser().then((user) {
        final msg = jsonEncode({
          'action': 'joinMatchmaking',
          'userId': user.userId,
        });
        _webSocketChannel?.sink.add(msg);
        safePrint('Joining matchmaking');
        setState(() => _isJoiningMatchmaking = true);
      }).catchError((e) {
        safePrint('Matchmaking error: $e');
      });
    });
  }

  void _nextOption() => setState(() => currentIndex = (currentIndex + 1) % options.length);
  void _previousOption() => setState(() => currentIndex = (currentIndex - 1 + options.length) % options.length);

  @override
  Widget build(BuildContext context) {
    // 1) If we haven’t yet matched, just show a spinner
    if (!_isCallActive) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      );
    }

    // 2) Once matched, show their profile pic as background and the full UI
    return Scaffold(
      body: Stack(
        children: [
          // Background: matched user’s picture
          if (_matchedUserProfilePicture != null)
            Positioned.fill(
              child: Image.network(
                _matchedUserProfilePicture!,
                fit: BoxFit.cover,
              ),
            ),

          // Blur + dark overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),

          // Top-left: matched user’s name
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              _matchedUserName ?? '',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Top-right: leave button
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                "Leave",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),

          // Center: call widget only
          Align(
            alignment: Alignment.center,
            child: JoinChannelAudio(channelID: _callId!),
          ),

          // Bottom: would‑you‑rather card
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Would you rather",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(icon: Icon(Icons.arrow_left), onPressed: _previousOption),
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

