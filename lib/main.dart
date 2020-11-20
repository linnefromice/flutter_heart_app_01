import 'package:flutter/material.dart';
import 'package:linnefromice/screens/custom_animation_by_mono_screen.dart';
import 'package:linnefromice/screens/custom_animation_screen.dart';
import 'package:linnefromice/screens/home_screen.dart';
import 'package:linnefromice/screens/original_rating_screen.dart';
import 'package:linnefromice/screens/rating_bar_screen.dart';

GlobalKey view_global_key = GlobalKey();
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
        '/original_rating': (context) => OriginalRatingScreen(),
        '/custom_animation': (context) => CustomAnimationScreen(),
        '/rating_bar': (context) => RatingBarScreen(),
        '/custom_animation_by_mono': (context) => CustomAnimationByMonoScreen(),
      },
    );
  }
}
