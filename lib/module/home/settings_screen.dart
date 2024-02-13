import 'package:flutter/material.dart';

class SettingsScreeen extends StatelessWidget {
  const SettingsScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Settings Screeen',
        style: TextStyle(
          fontSize: 30,
        ),
      )),
    );
  }
}
