import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/signup_provider.dart';
import '../models/User.dart';
import '../models/UserLocation.dart';
import '../components/location_picker.dart'; // Import the new widget
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  final _aboutController = TextEditingController();
  DateTime? _birthdate;
  XFile? _image;
  String? _gender;
  String? _genderPreference;
  UserLocation? _userLocation;

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
    if (image != null) {
      setState(() => _image = image);
    }
  }

  Future<void> _saveProfile(SignupProvider provider) async {
    try {
      final currentUser = await Amplify.Auth.getCurrentUser();
      final session = await Amplify.Auth.fetchAuthSession();
      final authType = session.isSignedIn ? APIAuthorizationType.userPools : APIAuthorizationType.apiKey;

      final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: currentUser.userId));
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
      final existingUser = getUserResponse.data;

      if (existingUser == null) {
        final newUser = User(
          userId: currentUser.userId,
          name: provider.userData['name'],
          age: provider.userData['age'],
          gender: provider.userData['gender'],
          gender_preference: provider.userData['gender_preference'],
          //profile_picture: provider.userData['profile_picture'],
          location: _userLocation,
          aboutMe: provider.userData['aboutMe'],
          called: null,
        );
        final createRequest = ModelMutations.create<User>(newUser, authorizationMode: authType);
        final createResponse = await Amplify.API.mutate(request: createRequest).response;
        if (createResponse.hasErrors) throw Exception('Error creating user: ${createResponse.errors}');
      } else {
        final updatedUser = existingUser.copyWith(
          name: provider.userData['name'],
          age: provider.userData['age'],
          gender: provider.userData['gender'],
          gender_preference: provider.userData['gender_preference'],
          //profile_picture: provider.userData['profile_picture'],
          location: _userLocation,
          aboutMe: provider.userData['aboutMe'],
          called: existingUser.called,
        );
        final updateRequest = ModelMutations.update<User>(updatedUser, authorizationMode: authType);
        final updateResponse = await Amplify.API.mutate(request: updateRequest).response;
        if (updateResponse.hasErrors) throw Exception('Error updating user: ${updateResponse.errors}');
      }
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error saving profile: $e')));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupProvider = Provider.of<SignupProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) => signupProvider.currentStep = index + 1,
            children: [
              // Step 1
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    /*ElevatedButton(
                      onPressed: _pickImage,
                      child: Text(_image == null ? 'Add Profile Picture' : 'Picture Added'),
                    ),*/
                  ],
                ),
              ),
              // Step 2
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: const InputDecoration(labelText: 'Gender'),
                      items: ['Man', 'Woman', 'Other']
                          .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                          .toList(),
                      onChanged: (value) => setState(() => _gender = value),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _genderPreference,
                      decoration: const InputDecoration(labelText: 'Gender Preference'),
                      items: ['Hetero', 'Homo', 'Bi', 'Other']
                          .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      onChanged: (value) => setState(() => _genderPreference = value),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: Text(_userLocation == null
                          ? 'Set Location'
                          : 'Location: (${_userLocation!.lat.toStringAsFixed(2)}, ${_userLocation!.long.toStringAsFixed(2)})'),
                      trailing: const Icon(Icons.map),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LocationPicker(
                              onLocationSelected: (location) {
                                setState(() => _userLocation = location);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              // Step 3
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _aboutController,
                      decoration: const InputDecoration(labelText: 'About Me'),
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: CustomProgressBar(currentStep: signupProvider.currentStep),
          ),
          Positioned(
            bottom: 60,
            right: 16,
            child: Row(
              children: [
                if (signupProvider.currentStep > 1)
                  ElevatedButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Back'),
                  ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (signupProvider.currentStep == 1 &&
                        _nameController.text.isNotEmpty &&
                        _birthdate != null /* &&
                        _image != null*/) {
                      signupProvider.addData({
                        'name': _nameController.text,
                        'age': _calculateAge(_birthdate!),
                        //'profile_picture': _image!.path,
                      });
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else if (signupProvider.currentStep == 2 &&
                        _gender != null &&
                        _genderPreference != null &&
                        _userLocation != null) {
                      signupProvider.addData({
                        'gender': _gender!,
                        'gender_preference': _genderPreference!,
                        'location': _userLocation,
                      });
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else if (signupProvider.currentStep == 3 &&
                        _aboutController.text.isNotEmpty) {
                      signupProvider.addData({'aboutMe': _aboutController.text});
                      _saveProfile(signupProvider);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('All fields are required')),
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

class CustomProgressBar extends StatelessWidget {
  final int currentStep;

  const CustomProgressBar({required this.currentStep, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBar(1 <= currentStep),
        const SizedBox(width: 8),
        _buildBar(2 <= currentStep),
        const SizedBox(width: 8),
        _buildBar(3 <= currentStep),
      ],
    );
  }

  Widget _buildBar(bool isActive) {
    return Container(
      width: 40,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
