import 'package:amplify_app/models/ModelProvider.dart';
import 'package:amplify_app/pages/call_page.dart';
import 'package:amplify_app/pages/home_page.dart';
import 'package:amplify_app/pages/signup_screen.dart';
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
      User? existingUser = getUserResponse.data;

      if (existingUser != null) {
        final User updatedUser = existingUser.copyWith(
          online: online,
          isAvailable: online ? true : true, // Always available unless in a call
          currentCall: '', // Clear call when online or offline
          matchmakingLock: '', // Clear lock
        );
        final updateRequest = ModelMutations.update<User>(updatedUser);
        await Amplify.API.mutate(request: updateRequest).response;
        safePrint('Set user: $userId online: $online, isAvailable: ${updatedUser.isAvailable}, currentCall: ${updatedUser.currentCall}');
      } else if (online) {
        final newUser = User(
          userId: userId,
          isAvailable: true,
          online: true,
          currentCall: null,
          matchmakingLock: null,
        );
        final createRequest = ModelMutations.create<User>(newUser);
        await Amplify.API.mutate(request: createRequest).response;
        safePrint('Created user $userId with online: true, isAvailable: true');
      }
    } catch (e) {
      safePrint('Error setting online status: $e');
    }
  }

  Future<Widget> _getHomeWidget() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      final userId = user.userId;
      final getUserRequest = ModelQueries.get(User.classType, UserModelIdentifier(userId: userId));
      final getUserResponse = await Amplify.API.query(request: getUserRequest).response;
      final existingUser = getUserResponse.data;

      if (existingUser != null &&
          existingUser.name != null &&
          (existingUser.profile_picture != '' || existingUser.profile_picture != null) &&
          existingUser.gender != null) {
        safePrint('User profile complete, routing to call page');
        return HomePage();
      } else {
        safePrint('User profile incomplete or missing, routing to signup');
        return SignupScreen();
      }
    } catch (e) {
      safePrint('Error determining home widget: $e');
      return SignupScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        title: 'Your App Name',
        theme:ThemeData(
          // iOS system blue
          primaryColor: const Color(0xFF007AFF),
          // iOS green accent
	  colorScheme: const ColorScheme.light(
            primary: Color(0xFF007AFF),
            secondary: Color(0xFF34C759),
          ),
          scaffoldBackgroundColor: Colors.white,
          // custom blue swatch for Material widgets
          primarySwatch: const MaterialColor(
            0xFF007AFF,
            <int, Color>{
              50: Color(0xFFE6F0FF),
              100: Color(0xFFB3D1FF),
              200: Color(0xFF80B1FF),
              300: Color(0xFF4D92FF),
              400: Color(0xFF266EFF),
              500: Color(0xFF007AFF),
              600: Color(0xFF0073F0),
              700: Color(0xFF0067D1),
              800: Color(0xFF005AB2),
              900: Color(0xFF004680),
            },
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: const Color(0xFF007AFF),
            unselectedItemColor: Colors.grey[400],
          ),
        ), 
        builder: Authenticator.builder(),
        home: Builder(
          builder: (context) => FutureBuilder<Widget>(
            future: _getHomeWidget(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Scaffold(body: Center(child: CircularProgressIndicator()));
              }
              return snapshot.data ?? SignupScreen();
            },
          ),
        ),
      ),
    );
  }
}
