import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  @override
  _GestureDetectorScreenState createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  final globalKey = GlobalKey<ScaffoldState>();
  String _message = "No gesture";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() => _message = "Tap" );
        },
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.6,
            heightFactor: 0.6,
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text(_message),
              ),
            ),
          ),
        )
      ),
    );
  }
}