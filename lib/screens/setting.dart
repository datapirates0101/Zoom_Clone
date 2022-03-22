import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomButton(
        text: 'Log Out',
        onPressed: () {
          AuthMethods().signOutUser();
          Navigator.of(context).pushReplacementNamed('/login');
        },
      ),
    );
  }
}
