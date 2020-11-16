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
                  RatedHeart(rate: 1.0, color: Colors.pink),
                  RatedHeart(rate: 0.7, color: Colors.pink),
                  RatedHeart(rate: 0.4, color: Colors.pink),
                  RatedHeart(rate: 0.1, color: Colors.pink),
                  RatedHeart(rate: 0.0, color: Colors.pink),
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
