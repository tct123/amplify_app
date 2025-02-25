import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_app/models/UserLocation.dart';
import 'package:amplify_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class TestUserButton extends StatelessWidget {
  const TestUserButton({super.key});
Future<void> _createTestUser() async {
  final currentUser = await Amplify.Auth.getCurrentUser();
  // Ensure the auth session is fully loaded with tokens.
  // Use userPools if we have a valid token; otherwise fall back to API key.
final session = await Amplify.Auth.fetchAuthSession();
final authType = session.isSignedIn
    ? APIAuthorizationType.userPools
    : APIAuthorizationType.apiKey;
print(authType);  
  final getUserRequest = ModelQueries.get(
      User.classType, UserModelIdentifier(userId: currentUser.userId));
  final getUserResponse =
      await Amplify.API.query(request: getUserRequest).response;
  final existingUser = getUserResponse.data;

  if (existingUser == null) {
    final newUser = User(
      userId: currentUser.userId,
      name: "Test User Woman",
      age: 25,
      gender: "Female",
      gender_preference: "Male",
      age_preference: "18, 25",
      location: UserLocation(lat: 37.7749, long: -122.4194),
      radius: 10,
      pictures: const [],
      profile_picture: "",
    );

    final createRequest =
        ModelMutations.create<User>(newUser, authorizationMode: authType);
    final createResponse =
        await Amplify.API.mutate(request: createRequest).response;
    if (createResponse.hasErrors) {
      safePrint('Error creating user: ${createResponse.errors}');
    } else {
      safePrint('User created successfully.');
    }
  } else {
    final updatedUser = existingUser.copyWith(
      name: "Test User Woman",
      age: 25,
      gender: "Female",
      gender_preference: "Male",
      age_preference: "18, 25",
      location: UserLocation(lat: 37.7749, long: -122.4194),
      radius: 10,
      pictures: const [],
      profile_picture: "",
    );
    final updateRequest =
        ModelMutations.update<User>(updatedUser, authorizationMode: authType);
    final updateResponse =
        await Amplify.API.mutate(request: updateRequest).response;
    if (updateResponse.hasErrors) {
      safePrint('Error updating user: ${updateResponse.errors}');
    } else {
      safePrint('User updated successfully.');
    }
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
