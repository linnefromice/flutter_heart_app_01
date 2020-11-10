import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatelessWidget {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Tap"));
          globalKey.currentState.showSnackBar(snackBar);
        },
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
            child: Container(
              color: Colors.green,
            ),
          ),
        )
      ),
    );
  }
}