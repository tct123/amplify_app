import 'dart:io';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_app/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/signup_provider.dart';
import '../models/User.dart'; // Your graphql-codegen user.dart
import 'package:amplify_flutter/amplify_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();
  DateTime? _birthdate;
  XFile? _image;
  String? _gender;
  String? _genderPreference;
  String? _location;

  int _calculateAge(DateTime birthdate) {
    final now = DateTime.now();
    int age = now.year - birthdate.year;
    if (now.month < birthdate.month || (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() => _image = image);
  }
Future<void> _saveProfile(SignupProvider provider) async {
  try {
    final currentUser = await Amplify.Auth.getCurrentUser();
    final session = await Amplify.Auth.fetchAuthSession();
    final authType = session.isSignedIn
        ? APIAuthorizationType.userPools
        : APIAuthorizationType.apiKey;

    // Check if user exists
    final getUserRequest = ModelQueries.get(
      User.classType,
      UserModelIdentifier(userId: currentUser.userId),
    );
    final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
    final existingUser = getUserResponse.data;

    if (existingUser == null) {
      // Create new user
      final newUser = User(
        userId: currentUser.userId,
        name: provider.userData['name'],
        age: provider.userData['age'],
        gender: provider.userData['gender'],
        gender_preference: provider.userData['gender_preference'],
        //profile_picture: provider.userData['profile_picture'],
        //location: _userLocation,
        aboutMe: provider.userData['aboutMe'],
      );
      final createRequest = ModelMutations.create<User>(
        newUser,
        authorizationMode: authType,
      );
      final createResponse = await Amplify.API.mutate(request: createRequest).response;
      if (createResponse.hasErrors) {
        throw Exception('Error creating user: ${createResponse.errors}');
      }
    } else {
      // Update existing user
      final updatedUser = existingUser.copyWith(
        name: provider.userData['name'],
        age: provider.userData['age'],
        gender: provider.userData['gender'],
        gender_preference: provider.userData['gender_preference'],
  //      profile_picture: provider.userData['profile_picture'],
 //       location: _userLocation,
        aboutMe: provider.userData['aboutMe'],
      );
      final updateRequest = ModelMutations.update<User>(
        updatedUser,
        authorizationMode: authType,
      );
      final updateResponse = await Amplify.API.mutate(request: updateRequest).response;
      if (updateResponse.hasErrors) {
        throw Exception('Error updating user: ${updateResponse.errors}');
      }
    }
    Navigator.pushReplacementNamed(context, '/home');
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error saving profile: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Stack(
        children: [
          // Swipeable content
          PageView(
	    physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              signupProvider.currentStep = index + 1;
            },
            children: [
              // Step 1
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 16),
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
                    SizedBox(height: 16),
                /*    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text(_image == null ? 'Add Profile Picture' : 'Picture Added'),
                    ),*/
                  ],
                ),
              ),
              // Step 2
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: InputDecoration(labelText: 'Gender'),
                      items: ['Man', 'Woman', 'Other']
                          .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                          .toList(),
                      onChanged: (value) => setState(() => _gender = value),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _genderPreference,
                      decoration: InputDecoration(labelText: 'Gender Preference'),
                      items: ['Hetero', 'Homo', 'Bi', 'Other']
                          .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      onChanged: (value) => setState(() => _genderPreference = value),
                    ),
                    SizedBox(height: 16),
                   /* DropdownButtonFormField<String>(
                      value: _location,
                      decoration: InputDecoration(labelText: 'Location'),
                      items: ['New York', 'London', 'Tokyo', 'Sydney']
                          .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                          .toList(),
                      onChanged: (value) => setState(() => _location = value),
                    ),*/
                  ],
                ),
              ),
              // Step 3
              SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _aboutController,
                      decoration: InputDecoration(labelText: 'About Me'),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Fixed progress bar at the bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: CustomProgressBar(currentStep: signupProvider.currentStep),
          ),
          // Navigation buttons
          Positioned(
            bottom: 60,
            right: 16,
            child: Row(
              children: [
                if (signupProvider.currentStep > 1)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Back'),
                  ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (signupProvider.currentStep == 1 &&
                        _nameController.text.isNotEmpty &&
                        _birthdate != null /*&&
                        _image != null*/) {
                      signupProvider.addData({
                        'name': _nameController.text,
                        'age': _calculateAge(_birthdate!),
                       // 'profile_picture': _image!.path,
                      });
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else if (signupProvider.currentStep == 2 &&
                        _gender != null &&
                        _genderPreference != null /*&&
                        _location != null*/) {
                      signupProvider.addData({
                        'gender': _gender!,
                        'gender_preference': _genderPreference!,
                        //'location': _location!,
                      });
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else if (signupProvider.currentStep == 3 &&
                        _aboutController.text.isNotEmpty) {
                      signupProvider.addData({'aboutMe': _aboutController.text});
                      _saveProfile(signupProvider);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('All fields are required')),
                      );
                    }
                  },
                  child: Text(signupProvider.currentStep == 3 ? 'Finish' : 'Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom progress bar widget
class CustomProgressBar extends StatelessWidget {
  final int currentStep;

  const CustomProgressBar({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBar(1 <= currentStep),
        SizedBox(width: 8),
        _buildBar(2 <= currentStep),
        SizedBox(width: 8),
        _buildBar(3 <= currentStep),
      ],
    );
  }

  Widget _buildBar(bool isActive) {
    return AnimatedContainer(
	    duration: Duration(milliseconds: 300),
      width: 40,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
