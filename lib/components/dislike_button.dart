import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_app/models/User.dart';
import 'package:amplify_app/models/UserDislike.dart';

class TestDislikeButton extends StatelessWidget {
  const TestDislikeButton({Key? key}) : super(key: key);

  Future<void> _createDislike() async {
    print('Starting _createDislike');

    // Step 1: Get the current authenticated user's ID.
    final currentUser = await Amplify.Auth.getCurrentUser();
    print('Current user ID (disliker): ${currentUser.userId}');

    // Step 2: Query all female users from the database.
    print('Querying female users from the database...');
    final listRequest = ModelQueries.list(
      User.classType,
      where: User.GENDER.eq("Female"),
    );
    final listResponse = await Amplify.API.query(request: listRequest).response;
    if (listResponse.hasErrors) {
      print('Error listing female users: ${listResponse.errors}');
      return;
    }
    final femaleUsers = listResponse.data?.items;
    if (femaleUsers == null || femaleUsers.isEmpty) {
      print('No female users found.');
      return;
    }
    print('Found ${femaleUsers.length} female users.');

    // Step 3: Select one female user (for example, the last one).
    final User? selectedUser = femaleUsers.last;
    print('Selected female user ID (disliked): ${selectedUser!.userId}');

    // Step 4: Create a UserDislike record.
    final userDislike = UserDislike(
      disliker: User(userId: currentUser.userId),
      disliked: selectedUser,
    );
    print('Constructed UserDislike object: $userDislike');

    // Step 5: Send the mutation request.
    final createRequest = ModelMutations.create<UserDislike>(
      userDislike,
      authorizationMode: APIAuthorizationType.userPools,
    );
    print('Sending create UserDislike request...');
    final createResponse = await Amplify.API.mutate(request: createRequest).response;
    if (createResponse.hasErrors) {
      print('Error creating UserDislike: ${createResponse.errors}');
    } else {
      print('UserDislike created successfully: ${createResponse.data}');
    }
    print('Finished _createDislike');
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _createDislike,
      tooltip: 'Create Dislike',
      child: const Icon(Icons.thumb_down),
    );
  }
}

