// lib/pages/signup_page2.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/signup_provider.dart';
import 'signup_page3.dart';

class SignupPage2 extends StatefulWidget {
  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  String? _gender;
  String? _genderPreference;
  String? _location;

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Step 2/3')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: 2 / 3),
            DropdownButtonFormField<String>(
              value: _gender,
              decoration: InputDecoration(labelText: 'Gender'),
              items: ['Man', 'Woman', 'Other']
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (value) => setState(() => _gender = value),
            ),
            DropdownButtonFormField<String>(
              value: _genderPreference,
              decoration: InputDecoration(labelText: 'Gender Preference'),
              items: ['Hetero', 'Homo', 'Bi', 'Other']
                  .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                  .toList(),
              onChanged: (value) => setState(() => _genderPreference = value),
            ),
            DropdownButtonFormField<String>(
              value: _location,
              decoration: InputDecoration(labelText: 'Location'),
              items: ['New York', 'London', 'Tokyo', 'Sydney']
                  .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                  .toList(),
              onChanged: (value) => setState(() => _location = value),
            ),
            ElevatedButton(
              onPressed: () {
                if (_gender != null && _genderPreference != null && _location != null) {
                  signupProvider.addData({
                    'gender': _gender!,
                    'gender_preference': _genderPreference!,
                    'location': _location!, // Store as string for now
                  });
                  signupProvider.nextStep();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignupPage3()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All fields are required')));
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
