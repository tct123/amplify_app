import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import '../models/User.dart';
import '../models/UserLocation.dart';

class UserService {
  Future<String> _uploadProfilePicture(String userId, File imageFile) async {
    final storagePath = StoragePath.fromString('profile-pictures/$userId/profile.jpg');
    
    try {
      safePrint('User ID: $userId');
      safePrint('Uploading to: $storagePath');
      // Upload the file to S3
      final uploadResult = await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromPath(imageFile.path),
        path: storagePath,
      ).result;

      safePrint('Upload successful: ${uploadResult.uploadedItem.path}');
      // Get the URL of the uploaded file
      final url = (await Amplify.Storage.getUrl(
  path: storagePath,
  options: const StorageGetUrlOptions(),
).result).url.toString();

      safePrint('URL retrieved: $url');
      return url;
    } on StorageException catch (e) {
      safePrint('Storage error: ${e.message}, details: ${e}');
      throw Exception('Error uploading profile picture: ${e.message}');
    } catch (e) {
      safePrint('Unexpected error: $e');
      throw Exception('Error uploading profile picture: $e');
    }
  }

  Future<void> saveUser({
    required String userId,
    required String name,
    required int age,
    required String gender,
    required String genderPreference,
    required File profilePicture,
    UserLocation? location,
    required String aboutMe,
  }) async {
    final session = await Amplify.Auth.fetchAuthSession();
    final authType = session.isSignedIn ? APIAuthorizationType.userPools : APIAuthorizationType.apiKey;

    // Upload profile picture
    final profilePictureUrl = await _uploadProfilePicture(userId, profilePicture);

    // Check if user exists
    final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: userId));
    final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
    final existingUser = getUserResponse.data;

    if (existingUser == null) {
      final newUser = User(
        userId: userId,
        name: name,
        age: age,
        gender: gender,
        gender_preference: genderPreference,
        profile_picture: profilePictureUrl,
        location: location,
        aboutMe: aboutMe,
        called: null,
      );
      final createRequest = ModelMutations.create<User>(newUser, authorizationMode: authType);
      final createResponse = await Amplify.API.mutate(request: createRequest).response;
      if (createResponse.hasErrors) throw Exception('Error creating user: ${createResponse.errors}');
    } else {
      final updatedUser = existingUser.copyWith(
        name: name,
        age: age,
        gender: gender,
        gender_preference: genderPreference,
        profile_picture: profilePictureUrl,
        location: location,
        aboutMe: aboutMe,
        called: existingUser.called,
      );
      final updateRequest = ModelMutations.update<User>(updatedUser, authorizationMode: authType);
      final updateResponse = await Amplify.API.mutate(request: updateRequest).response;
      if (updateResponse.hasErrors) throw Exception('Error updating user: ${updateResponse.errors}');
    }
  }
}
