import 'package:flutter/material.dart';
import 'package:linnefromice/utils/tweens/ghost_fade_tween.dart';
import 'package:linnefromice/utils/tweens/switch_string_tween.dart';

class CustomAnimationByMonoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CustomAnimationByMonoScreen> with SingleTickerProviderStateMixin {
  static const _texts = [
    'First',
    'Second',
    'Third'
  ];

  static const _colors = [
    Colors.black,
    Colors.blue,
    Colors.red,
  ];

  var _index = 0;
  String get _currentText => _texts[_index % 3];
  Color get _currentColor => _colors[_index % 3];

  AnimationController _animation;
  GhostFadeTween _colorTween;
  SwitchStringTween _stringTween;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    )..addListener(() {
      setState(() {});
    });
    _colorTween = GhostFadeTween(end: _currentColor);
    _stringTween = SwitchStringTween(
      begin: _currentText,
      end: _currentText
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomAnimation By Mono"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
            _colorTween = GhostFadeTween(
              begin: _colorTween.end,
              end: _currentColor
            );
            _stringTween = SwitchStringTween(
              begin: _stringTween.end,
              end: _currentText,
            );
          });
          _animation.forward(from: 0);
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Text(
          _stringTween.evaluate(_animation),
          style: Theme.of(context).textTheme.title.copyWith(
            color: _colorTween.evaluate(_animation),
          ),
        ),
      ),
    );
  }
}