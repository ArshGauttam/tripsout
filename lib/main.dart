import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tripsout/constant.dart';
import 'package:tripsout/profileScreen.dart';
import 'package:tripsout/sign_in_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

// ignore: non_constant_identifier_names

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  FirebaseUIAuth.configureProviders([
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? SigningInScreen.routeName
          : ProfileScreenWidget.routeName,
      routes: {
        ProfileScreenWidget.routeName: (context) => const ProfileScreenWidget(),
        SigningInScreen.routeName: (context) => const SigningInScreen(),
      },
    );
  }
}
