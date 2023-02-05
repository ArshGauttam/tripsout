import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:tripsout/constant.dart';

class ProfileScreenWidget extends StatelessWidget {
  static const routeName = '/profile';
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: [
        EmailAuthProvider(),
        GoogleProvider(clientId: GOOGLE_CLIENT_ID)
      ],
      actions: [
        SignedOutAction((context) {
          Navigator.pushReplacementNamed(context, '/sign-in');
        }),
      ],
    );
  }
}
