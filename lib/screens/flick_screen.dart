import 'package:flick/flick_controller.dart';
import 'package:flutter/material.dart';
import 'package:linnefromice/main.dart';

class FlickScreen extends StatelessWidget {
  Widget box() {
    return Container(
      key: view_global_key,
      width: 200,
      height: 200,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          ),
          child: Center(
            child: Text(
              "Flick",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flick'),
      ),
      body: FlickController(
        box(),
        true,
        view_global_key,
        sensitivity: 0.1,
      ),
    );
  }
}