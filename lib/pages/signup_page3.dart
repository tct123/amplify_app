// lib/pages/signup_page3.dart
import 'package:amplify_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import '../providers/signup_provider.dart';

class SignupPage3 extends StatefulWidget {
  @override
  _SignupPage3State createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  final _aboutController = TextEditingController();

  Future<void> _saveProfile(SignupProvider provider) async {
    try {
      final authUser = await Amplify.Auth.getCurrentUser();
      final user = User(
        userId: authUser.userId, // Required
        name: provider.userData['name'],
        age: provider.userData['age'],
        gender: provider.userData['gender'],
        gender_preference: provider.userData['gender_preference'],
        profile_picture: provider.userData['profile_picture'], // Placeholder
        location: provider.userData['location'], // String for now, cast later
        aboutMe: _aboutController.text,
      );
      // await Amplify.DataStore.save(user);
      Navigator.pushReplacementNamed(context, '/home'); // Your main screen
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Step 3/3')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: 3 / 3),
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(labelText: 'About Me'),
              maxLines: 4,
            ),
            ElevatedButton(
              onPressed: () {
                if (_aboutController.text.isNotEmpty) {
                  signupProvider.addData({'aboutMe': _aboutController.text});
                  _saveProfile(signupProvider);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('About Me is required')));
                }
              },
              child: Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
