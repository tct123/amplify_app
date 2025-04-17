import 'dart:convert';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_app/models/ModelProvider.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String? _callId;
  bool _isCallActive = false;
  RtcEngine? _engine;

  @override
  void initState() {
    super.initState();
    _startMatchmaking();
    _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    try {
      _engine = createAgoraRtcEngine();
      await _engine!.initialize(const RtcEngineContext(
        appId: 'your-agora-app-id',
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ));
      safePrint('Agora initialized');
    } catch (e) {
      safePrint('Error initializing Agora: $e');
    }
  }

  Future<void> _startMatchmaking() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final request = GraphQLRequest(
        document: '''
          mutation MatchUsers(\$userId: ID!) {
            matchUsers(userId: \$userId) {
              callId
              matchedUser {
                userId
                name
                profilePicture
              }
              status
              error
            }
          }
        ''',
        variables: {'userId': user.userId},
      );
      final response = await Amplify.API.mutate(request: request).response;
      safePrint('Raw response: ${response.data}');

      if (response.errors.isNotEmpty) {
        safePrint('GraphQL errors: ${response.errors}');
        return;
      }

      if (response.data == null) {
        safePrint('No data in response');
        return;
      }

      final data = response.data is String ? jsonDecode(response.data) : response.data;
      if (data is! Map) {
        safePrint('Unexpected data type: ${data.runtimeType}, data: $data');
        return;
      }

      if (data['matchUsers']?['error'] != null) {
        safePrint('Matchmaking error: ${data['matchUsers']['error']}');
        return;
      }
      if (data['matchUsers']?['callId'] != null) {
        setState(() {
          _callId = data['matchUsers']['callId'];
          _isCallActive = true;
        });
        safePrint('Match found, callId: $_callId, matchedUser: ${data['matchUsers']['matchedUser']}');
        if (_engine != null && _callId != null) {
          await _engine!.joinChannel(
            token: 'your-agora-token',
            channelId: _callId!,
            uid: 0,
            options: const ChannelMediaOptions(),
          );
          safePrint('Joined Agora channel: $_callId');
        }
      } else {
        safePrint('Matchmaking status: ${data['matchUsers']['status']}');
      }
    } catch (e) {
      safePrint('Matchmaking failed: $e');
    }
  }

  Future<void> _leaveCall() async {
    try {
      safePrint('Leaving call, resetting user state');
      if (_engine != null) {
        await _engine!.leaveChannel();
        safePrint('Left Agora channel');
      }

      final user = await Amplify.Auth.getCurrentUser();
      final userId = user.userId;
      final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: userId));
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
      final existingUser = getUserResponse.data;

      if (existingUser != null) {
        final updatedUser = existingUser.copyWith(
          currentCall: null,
          isAvailable: true,
          online: true, // Keep online for immediate rematching
        );
        final updateRequest = ModelMutations.update<User>(updatedUser);
        await Amplify.API.mutate(request: updateRequest).response;
        safePrint('Cleared currentCall and set isAvailable: true for user $userId');
      } else {
        safePrint('No user record found for $userId');
      }

      setState(() {
        _isCallActive = false;
        _callId = null;
      });
      Navigator.pop(context);
    } catch (e) {
      safePrint('Error leaving call: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error leaving call')),
      );
    }
  }

  @override
  void dispose() {
    _engine?.release();
    safePrint('CallPage disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isCallActive ? 'In Call: $_callId' : 'Finding Match...'),
            ElevatedButton(
              onPressed: _isCallActive ? _leaveCall : null,
              child: const Text('Leave Call'),
            ),
          ],
        ),
      ),
    );
  }
}
