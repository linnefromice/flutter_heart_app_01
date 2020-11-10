import 'package:flutter/material.dart';
import 'screens/liquid_swipe_screen.dart';

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
      home: LiquidSwipeScreen(),
    );
  }
}
