import 'package:flutter/material.dart';

class OriginalRatingScreen extends StatelessWidget {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatedHeart(rate: 1.0),
                  RatedHeart(rate: 0.7),
                  RatedHeart(rate: 0.4),
                  RatedHeart(rate: 0.1),
                  RatedHeart(rate: 0.0),
                ],
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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