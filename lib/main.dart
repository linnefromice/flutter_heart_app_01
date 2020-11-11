import 'package:flutter/material.dart';
import 'package:linnefromice/screens/gesture_detector_screen.dart';
import 'package:linnefromice/screens/home_screen.dart';
import 'package:linnefromice/screens/rating_screen.dart';
import 'package:linnefromice/screens/liquid_swipe_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/rating': (context) => RatingScreen(),
        '/gesture_detector': (context) => GestureDetectorScreen(),
        '/liquid_swipe': (context) => LiquidSwipeScreen(),
      },
    );
  }
}
