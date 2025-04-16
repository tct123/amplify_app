import 'package:amplify_app/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'join_call_page.dart'; // Your Agora widget
import 'dart:ui';
import 'dart:convert'; // For JSON parsing

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final List<String> options = [
    "go skiing or snorkelling?",
    "eat pizza or burgers?",
    "travel to the mountains or the beach?",
    "read a book or watch a movie?",
    "stay in or go out?"
  ];
  int currentIndex = 0;
  String? callId;
  String? matchedProfilePicture;
  String? matchedUserName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _startMatchmaking();
  }

  Future<void> _startMatchmaking() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      const graphqlDoc = r'''
        mutation MatchUsers($userId: ID!) {
          matchUsers(userId: $userId) {
            callId
            matchedUser { userId name profilePicture }
            status
            error
          }
        }
      ''';

      // Refresh session to ensure valid token
      await Amplify.Auth.fetchAuthSession(
        options: const FetchAuthSessionOptions(),
      );

      while (mounted && callId == null) {
        final request = GraphQLRequest<String>(
          document: graphqlDoc,
          variables: {'userId': user.userId},
        );
        final response = await Amplify.API.mutate(request: request).response;

        if (response.errors.isNotEmpty) {
          safePrint('Matchmaking error: ${response.errors}');
          setState(() => isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error finding match: ${response.errors}')),
          );
          break;
        }

        if (response.data != null) {
          final data = jsonDecode(response.data!)?['matchUsers'];
          if (data['callId'] != null) {
            setState(() {
              callId = data['callId'];
              matchedProfilePicture = data['matchedUser']['profilePicture'];
              matchedUserName = data['matchedUser']['name'];
              isLoading = false;
            });
            break;
          } else if (data['error'] != null) {
            safePrint('Matchmaking failed: ${data['error']}');
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${data['error']}')),
            );
            break;
          }
        }
        await Future.delayed(Duration(seconds: 2)); // Poll every 2 seconds
      }
    } catch (e) {
      safePrint('Unexpected error: $e');
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error: $e')),
      );
    }
  }

  Future<void> _leaveCall() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final getUserRequest = ModelQueries.get(
        User.classType,
        UserModelIdentifier(userId: user.userId),
      );
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
      final existingUser = getUserResponse.data;

      if (existingUser != null) {
        final updatedUser = existingUser.copyWith(
          isAvailable: true,
          online: true,
          currentCall: null,
        );
        final updateRequest = ModelMutations.update<User>(updatedUser);
        await Amplify.API.mutate(request: updateRequest).response;
        safePrint('User marked as available and online');
      }
    } catch (e) {
      safePrint('Error leaving call: $e');
    }
    Navigator.pop(context);
  }

  void _nextOption() => setState(() => currentIndex = (currentIndex + 1) % options.length);
  void _previousOption() => setState(() => currentIndex = (currentIndex - 1 + options.length) % options.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Image
          Positioned.fill(
            child: isLoading || matchedProfilePicture == null
                ? Container(color: Colors.grey.shade300)
                : Image.network(
                    matchedProfilePicture!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey,
                      child: Center(child: Text('Failed to load image')),
                    ),
                  ),
          ),
          // 2. Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          // 3. Center Content
          Align(
            alignment: Alignment.center,
            child: isLoading
                ? CircularProgressIndicator()
                : JoinChannelAudio(channelID: callId ?? 'test'),
          ),
          // 4. Top-left Corner Text
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              matchedUserName ?? 'Waiting...',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 5. Top-right Leave Button
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              child: Text(
                "Leave",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: _leaveCall,
            ),
          ),
          // 6. Bottom Center Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 8.0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Would you rather",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_left),
                            onPressed: _previousOption,
                          ),
                          Expanded(
                            child: Text(
                              options[currentIndex],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_right),
                            onPressed: _nextOption,
                          ),
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
