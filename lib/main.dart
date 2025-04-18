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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setOnlineStatus(true);
  }

  @override
  void dispose() {
    _setOnlineStatus(false);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _setOnlineStatus(true);
    } else if (state == AppLifecycleState.paused || state == AppLifecycleState.detached) {
      _setOnlineStatus(false);
    }
  }

  Future<void> _setOnlineStatus(bool online) async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) return;

      final user = await Amplify.Auth.getCurrentUser();
      final userId = user.userId;

      final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: userId));
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
      final existingUser = getUserResponse.data;

      if (existingUser != null) {
        final updatedUser = existingUser.copyWith(online: online);
        final updateRequest = ModelMutations.update<User>(updatedUser);
        await Amplify.API.mutate(request: updateRequest).response;
        safePrint('Set user $userId online status to $online');
      }
    } catch (e) {
      safePrint('Error setting online status: $e');
    }
  }

  Future<String> _determineInitialRoute() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      if (!session.isSignedIn) {
        safePrint('User not signed in, routing to signup');
        return '/signup';
      }


      final user = await Amplify.Auth.getCurrentUser();
      final userId = user.userId;
      final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: userId));
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
      return '/signup';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignupScreen(),
        '/call': (context) => CallPage(),
      },
      home: FutureBuilder<String>(
        future: _determineInitialRoute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, snapshot.data!);
            });
          }
          return Container();
        },
      ),
    );
  }
}
