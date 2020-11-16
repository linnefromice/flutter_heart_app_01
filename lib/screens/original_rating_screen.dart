import 'dart:math';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class OriginalRatingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OriginalRatingScreen> {
  double _currentSliderValue;

  @override
  void initState() {
    _currentSliderValue = 2.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart App'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                value: _currentSliderValue,
                min: 0.0,
                max: 5.0,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) => setState(() => _currentSliderValue = value),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatedHeart(rate: min(1, max(0, _currentSliderValue)), color: Colors.pink),
                  RatedHeart(rate: min(1, max(0, _currentSliderValue - 1)), color: Colors.pink),
                  RatedHeart(rate: min(1, max(0, _currentSliderValue - 2)), color: Colors.pink),
                  RatedHeart(rate: min(1, max(0, _currentSliderValue - 3)), color: Colors.pink),
                  RatedHeart(rate: min(1, max(0, _currentSliderValue - 4)), color: Colors.pink),
                ],
              ),
              Center(
                child: Badge(
                  badgeContent: Text(_currentSliderValue.toInt().toString()),
                  child: Icon(Icons.favorite),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatedHeart(rate: 1.0, color: Colors.red),
                  RatedHeart(rate: 1.0, color: Colors.blue),
                  RatedHeart(rate: 1.0, color: Colors.green),
                  RatedHeart(rate: 1.0, color: Colors.yellow),
                  RatedHeart(rate: 0.25, color: Colors.purple),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatedIcon(iconData: Icons.star, size: 100, rate: 1.0, color: Colors.yellow),
                  RatedIcon(iconData: Icons.star, size: 100, rate: 1.0, color: Colors.yellow),
                  RatedIcon(iconData: Icons.star, size: 100, rate: 0.75, color: Colors.yellow)
                ],
              ),
            ],
          )
      ),
    );
  }
}


class RatedHeart extends StatelessWidget {
  RatedHeart({this.rate, this.color});
  final double rate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RatedIcon(
      iconData: Icons.favorite,
      size: 50,
      rate: rate,
      color: color
    );
  }
}

class RatedIcon extends StatelessWidget {
  RatedIcon({this.iconData, this.size, this.rate, this.color});
  final IconData iconData;
  final double size;
  final double rate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [color, Colors.white],
        stops: [rate, rate],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: Container(
        child: Center(
          child: Icon(
            iconData,
            size: size,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
