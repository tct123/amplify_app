import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '../models/ModelProvider.dart';

class MatchService {
  static const _apiUrl = 'https://bo2kwc02qd.execute-api.eu-north-1.amazonaws.com/prod';

  Future<List<User>> fetchMatches(String userId) async {
    try {
      print('MatchService: fetchMatches called with userId: $userId');
      // Fetch auth session
      final authPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey) as AmplifyAuthCognito;
      final session = await authPlugin.fetchAuthSession(
        options: const FetchAuthSessionOptions(forceRefresh: true),
      );

      // Extract user pool tokens
      if (session is! CognitoAuthSession || session.userPoolTokensResult.value == null) {
        throw Exception('Failed to retrieve Cognito user pool tokens');
      }

      // Get the token object
      final tokens = session.userPoolTokensResult.value!;
      print('MatchService: tokens: ${tokens.toJson()}');

      // Reconstruct JWT from header, claims, and signature
      final tokenJson = tokens.accessToken.toJson();
      final header = base64UrlEncode(utf8.encode(jsonEncode(tokenJson['header'])));
      final claims = base64UrlEncode(utf8.encode(jsonEncode(tokenJson['claims'])));
      final signature = tokenJson['signature'] as String;
      final accessToken = '$header.$claims.$signature';

      print('MatchService: reconstructed accessToken: $accessToken');

      // Validate accessToken is a JWT
      if (!accessToken.contains('.') || accessToken.split('.').length != 3) {
        throw Exception('Invalid access token format: not a valid JWT. Got: $accessToken');
      }

      final uri = Uri.parse(_apiUrl).replace(queryParameters: {'userId': userId});
      print('MatchService: GET $uri');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
      );
      print('MatchService: response.statusCode: ${response.statusCode}');
      print('MatchService: response.body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Failed to load matches: ${response.statusCode} - ${response.body}');
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final usersJson = data['users'] as List<dynamic>;
      print('MatchService: usersJson length: ${usersJson.length}');

      final users = usersJson.map((u) {
        final map = u as Map<String, dynamic>;
        print('MatchService: parsing user: $map');
        return User(
          userId: map['userId'] as String,
          name: map['name'] as String?,
          profile_picture: map['profile_picture'] as String?,
          age: map['age'] as int?,
          gender: map['gender'] as String?,
        );
      }).toList();

      print('MatchService: returning ${users.length} users');
      return users;
    } catch (e, st) {
      print('MatchService: error in fetchMatches: $e');
      print('Stack trace: $st');
      rethrow;
    }
  }
}
