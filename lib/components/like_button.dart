import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_app/models/User.dart';
import 'package:amplify_app/models/UserLike.dart';

class TestLikeButton extends StatelessWidget {
  const TestLikeButton({Key? key}) : super(key: key);

  Future<void> _createLike() async {
    print('Starting _createLike');

    // Step 1: Get the current authenticated user's ID.
    final currentUser = await Amplify.Auth.getCurrentUser();
    print('Current user ID (liker): ${currentUser.userId}');

    // Step 2: Query all female users from the database.
    // Assuming your generated User model has a static field "GENDER" with an eq operator.
    print('Querying female users from the database...');
    final listRequest = ModelQueries.list(
      User.classType,
      where: User.GENDER.eq("Male"),
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

    // Step 3: Select one female user (for example, the first one).
    final User? selectedUser = femaleUsers.first;
    print('Selected female user ID (liked): ${selectedUser!.userId}');

    final User likingUser = User(
	    userId: currentUser.userId,
	    );

    // Step 4: Create a UserLike record.
    final userLike = UserLike(
      // Do not provide an explicit id so that the backend auto-generates one.
      // if so, pass null or omit them if they're optional.
      liker: likingUser,
      liked: selectedUser,
    );
    print('Constructed UserLike object: $userLike');

    // Step 5: Send the mutation request.
    final createRequest = ModelMutations.create<UserLike>(
      userLike,
      authorizationMode: APIAuthorizationType.userPools,
    );
    print('Sending create UserLike request...');
    final createResponse = await Amplify.API.mutate(request: createRequest).response;
    if (createResponse.hasErrors) {
      print('Error creating UserLike: ${createResponse.errors}');
    } else {
      print('UserLike created successfully: ${createResponse.data}');
    }
    print('Finished _createLike');
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _createLike,
      tooltip: 'Create Like',
      child: const Icon(Icons.thumb_up),
    );
  }
}
