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
            child: Text('Hello World',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/rating'),
            child: Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(child: Text('RatingScreen')),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/gesture_detector'),
            child: Container(
              height: 50,
              color: Colors.amber[500],
              child: Center(child: Text('GestureDetector')),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/liquid_swipe'),
            child: Container(
              height: 50,
              color: Colors.amber[500],
              child: Center(child: Text('LiquidSwipe')),
            ),
          ),
        ],
      ),
    );
  }
}