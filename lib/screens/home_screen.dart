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
              color: Colors.amber[900],
              child: Center(child: Text('RatingScreen')),
            ),
          ),
          Container(
            child: Center(
              child: RadiantGradientMask(
                child: Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: Center(
              child: LinearGradientMask(
                child: Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatedHeart(rate: 1.0),
              RatedHeart(rate: 0.7),
              RatedHeart(rate: 0.4),
              RatedHeart(rate: 0.1),
              RatedHeart(rate: 0.0),
            ],
          )
        ],
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Colors.white, Colors.pink, Colors.white],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.pink, Colors.white],
        stops: [0.7, 0.7],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

class RatedHeart extends StatelessWidget {
  RatedHeart({this.rate});
  final double rate;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.pink, Colors.white],
        stops: [rate, rate],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: Container(
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}