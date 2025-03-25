// lib/pages/signup_page1.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/signup_provider.dart';
import 'signup_page2.dart';

class SignupPage1 extends StatefulWidget {
  @override
  _SignupPage1State createState() => _SignupPage1State();
}

class _SignupPage1State extends State<SignupPage1> {
  final _nameController = TextEditingController();
  DateTime? _birthdate;
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() => _image = image);
  }

  int _calculateAge(DateTime birthdate) {
    final now = DateTime.now();
    int age = now.year - birthdate.year;
    if (now.month < birthdate.month || (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Step 1/3')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            LinearProgressIndicator(value: 1 / 3),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            ListTile(
              title: Text(_birthdate == null
                  ? 'Select Birthdate'
                  : _birthdate!.toString().split(' ')[0]),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (date != null) setState(() => _birthdate = date);
              },
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text(_image == null ? 'Add Profile Picture' : 'Picture Added'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _birthdate != null &&
                    _image != null) {
                  signupProvider.addData({
                    'name': _nameController.text,
                    'age': _calculateAge(_birthdate!),
                    'profile_picture': _image!.path, // Upload to S3 later
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignupPage2()));
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
