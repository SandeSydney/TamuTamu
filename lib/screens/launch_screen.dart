import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tamutamu/screens/home_screen.dart';

// the splash screen to TamuTamu
class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      image: Image.asset('assets/images/TamuTamu.png'),
      loadingText: Text('Loading...'),
      loaderColor: Color(0xFF323B60),
      photoSize: 200.0,
    );
  }
}
