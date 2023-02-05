import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:tripsout/constant.dart';

class SigningInScreen extends StatelessWidget {
  static const routeName = '/sign-in';
  const SigningInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      styles: const {
        EmailFormStyle(
          signInButtonVariant: ButtonVariant.text,
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black))),
        ),
      },
      showAuthActionSwitch: true,
      headerMaxExtent: 200,
      headerBuilder: (context, constraints, shrinkOffset) {
        return const Center(
            child: Text(
          'TripsOut',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900),
        ));
      },
      footerBuilder: (context, action) {
        return Column(
          children: const [
            Text(
              'Trips & Travel private Limited',
              style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
          ],
        );
      },
      providers: [
        EmailAuthProvider(),
        GoogleProvider(clientId: GOOGLE_CLIENT_ID)
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.pushReplacementNamed(context, '/profile');
        }),
      ],
    );
  }
}
