import 'package:amplify_app/models/ModelProvider.dart';
import 'package:amplify_app/pages/call_page.dart';
import 'package:amplify_app/pages/signup_screen.dart'; // New combined screen
import 'package:amplify_app/providers/signup_provider.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'amplify_outputs.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(
      ChangeNotifierProvider<SignupProvider>(
        create: (_) => SignupProvider(),
        child: MyApp(),
      ),
    );
  } on AmplifyException catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(body: Center(child: Text("Error: ${e.message}"))),
      ),
    );
  }
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugins([
      AmplifyAuthCognito(),
      AmplifyAPI(options: APIPluginOptions(modelProvider: ModelProvider.instance)),
      AmplifyStorageS3(),
    ]);
    await Amplify.configure(amplifyConfig);
    safePrint('Successfully configured Amplify');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
    rethrow;
  }
}


class MyApp extends StatelessWidget {
  Future<String> _determineInitialRoute() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) {
        safePrint('User not signed in, routing to signup');
        return '/signup';
      }

      final user = await Amplify.Auth.getCurrentUser();
      final userId = user.userId;
      safePrint('Checking user profile for: $userId');

      final getUserRequest = ModelQueries.get(
        User.classType,
        UserModelIdentifier(userId: userId),
      );
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;

      if (getUserResponse.data != null && getUserResponse.data!.name != null) {
        safePrint('User profile exists, routing to call page');
        return '/call';
      } else {
        safePrint('User profile incomplete, routing to signup');
        return '/signup';
      }
    } catch (e) {
      safePrint('Error determining route: $e');
      return '/signup'; // Fallback to signup on error
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Placeholder until we determine the route
      routes: {
        '/signup': (context) => SignupScreen(), // Your signup screen
        '/call': (context) => CallPage(), // Your call page
      },
      home: FutureBuilder<String>(
        future: _determineInitialRoute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ); // Loading screen while checking
          }
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, snapshot.data!);
            });
          }
          return Container(); // Temporary empty container
        },
      ),
    );
  }
}
