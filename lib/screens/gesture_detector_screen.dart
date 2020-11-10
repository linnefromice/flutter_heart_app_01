import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  @override
  _GestureDetectorScreenState createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  String _messageOnVerticalDragStart = "No gesture";
  String _messageOnVerticalDragUpdate = "No gesture";
  String _messageOnVerticalDragEnd = "No gesture";
  String _messageOnHorizontalDragStart = "No gesture";
  String _messageOnHorizontalDragUpdate = "No gesture";
  String _messageOnHorizontalDragEnd = "No gesture";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragStart: (details) => setState(() => _messageOnVerticalDragStart = "globalPosition:${details.globalPosition}" ),
            onVerticalDragUpdate: (details) => setState(() => _messageOnVerticalDragUpdate = "globalPosition:${details.globalPosition}\ndelta:${details.delta}" ),
            onVerticalDragEnd: (details) => setState(() => _messageOnVerticalDragEnd = "velocity:${details.velocity}" ),
            onHorizontalDragStart: (details) => setState(() => _messageOnHorizontalDragStart = "globalPosition:${details.globalPosition}" ),
            onHorizontalDragUpdate: (details) => setState(() => _messageOnHorizontalDragUpdate = "globalPosition:${details.globalPosition}\ndelta:${details.delta}" ),
            onHorizontalDragEnd: (details) => setState(() => _messageOnHorizontalDragEnd = "velocity:${details.velocity}" ),
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 0.6,
                child: Container(
                  color: Colors.green,
                  child: Center(
                      child: Column(
                        children: [
                          Text("onVerticalDragStart\n${_messageOnVerticalDragStart}"),
                          Text("onVerticalDragUpdate\n${_messageOnVerticalDragUpdate}"),
                          Text("onVerticalDragEnd\n${_messageOnVerticalDragEnd}"),
                          Text("onHorizontalDragStart\n${_messageOnHorizontalDragStart}"),
                          Text("onHorizontalDragUpdate\n${_messageOnHorizontalDragUpdate}"),
                          Text("onHorizontalDragEnd\n${_messageOnHorizontalDragEnd}"),
                        ],
                      )
                  ),
                ),
              ),
            )
          ),
          Positioned(
            left: 20,
            top: 20,
            width: 10,
            height: 10,
            child: Container(color: Colors.blue),
          ),
          Positioned(
            left: 380,
            top: 730,
            width: 10,
            height: 10,
            child: Container(color: Colors.red),
          ),
        ],
      )
    );
  }
}