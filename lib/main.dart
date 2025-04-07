import 'package:amplify_app/models/ModelProvider.dart';
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
        child: const MyApp(),
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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        title: 'Call App',
        theme: ThemeData(primarySwatch: Colors.blue),
        builder: Authenticator.builder(),
        home: SignupScreen(), // Single signup screen
      ),
    );
  }
}
