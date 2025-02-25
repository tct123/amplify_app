import 'package:amplify_app/models/UserLocation.dart';
import 'package:amplify_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class TestUserButton extends StatelessWidget {
  const TestUserButton({super.key});

  Future<void> _createTestUser() async {
    // Create a test user with no likes, matches or dislikes.
    final currentUser = await Amplify.Auth.getCurrentUser();

    final testUser = User(
	    userId: currentUser.userId,
      name: "Test User Woman",
      age: 25,
      gender: "Female",
      gender_preference: "Male",
      age_preference: "18, 25",
      location: UserLocation(lat:37.7749, long: -122.4194), // Example: San Francisco coordinates
      radius: 10,
      pictures: const [],
      profile_picture: "",
      // Relationships (likes, likedBy, etc.) are left unset to start with.
    );

    try {
      final request = ModelMutations.create<User>(testUser);
      final response = await Amplify.API.mutate(request: request).response;
      if (response.hasErrors) {
        safePrint('Error creating user: ${response.errors}');
      } else {
        safePrint('Test user created successfully.');
      }
    } on ApiException catch (e) {
      safePrint('API Exception while creating user: $e');
    } catch (e) {
      safePrint('Unexpected error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: _createTestUser,
        tooltip: 'Add Test User',
        child: const Icon(Icons.person_add),
    );
  }
}
