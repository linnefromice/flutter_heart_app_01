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
      key: globalKey,
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _message = "Tap";
          });
          final snackBar = SnackBar(content: Text("Tap"));
          globalKey.currentState.showSnackBar(snackBar);
        },
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
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