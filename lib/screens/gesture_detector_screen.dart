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
        // onTap: () => setState(() => _message = "onTap" ),
        onHorizontalDragDown: (details) => setState(() => _message = "onHorizontalDragDown\nglobalPosition = ${details.globalPosition}" ),
        onVerticalDragDown: (details) => setState(() => _message = "onVerticalDragDown\nglobalPosition = ${details.globalPosition}" ),
        // onVerticalDragStart: (details) => setState(() => _message = "onVerticalDragStart\nglobalPosition = ${details.globalPosition}" ),
        // onVerticalDragEnd: (details) => setState(() => _message = "onVerticalDragEnd\nvelocity = ${details.velocity}" ),
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