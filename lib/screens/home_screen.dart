import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.center,
            child: Text('Heart App',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          ),
          Text("Original"),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/original_rating'),
            child: Container(
              height: 50,
              color: Colors.amber[900],
              child: Center(child: Text('OriginalRatingScreen')),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/custom_animation'),
            child: Container(
              height: 50,
              color: Colors.amber[800],
              child: Center(child: Text('CustomAnimationScreen')),
            ),
          ),
          Text("Other"),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/rating_bar'),
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: Center(child: Text('RatingBarScreen')),
            ),
          ),
        ],
      ),
    );
  }
}
