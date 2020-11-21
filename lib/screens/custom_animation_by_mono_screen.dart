import 'package:flutter/material.dart';

class GhostFadeTween extends Tween<Color> {
  GhostFadeTween({
    Color begin,
    Color end,
  }) : super(
    begin: begin,
    end: end,
  );
  final middle = Colors.white;

  @override
  Color lerp(double t) {
    if (t < 0.5) {
      return Color.lerp(begin, middle, t * 2);
    } else {
      return Color.lerp(middle, end, (t - 0.5) * 2);
    }
  }
}

class SwitchStringTween extends Tween<String> {
  SwitchStringTween({
    String begin,
    String end,
  }) : super(begin: begin, end: end);

  @override
  String lerp(double t) => t < 0.5 ? begin : end;
}

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
  ColorTween _colorTween;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    )..addListener(() {
      setState(() {});
    });
    _colorTween = ColorTween(end: _currentColor);
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
            _colorTween = ColorTween(
              begin: _colorTween.end,
              end: _currentColor
            );
          });
          _animation.forward(from: 0);
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: Text(
          _currentText,
          style: Theme.of(context).textTheme.title.copyWith(
            color: _colorTween.evaluate(_animation),
          ),
        ),
      ),
    );
  }
}