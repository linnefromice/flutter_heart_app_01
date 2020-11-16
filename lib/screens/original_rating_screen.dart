import 'package:flutter/material.dart';

class OriginalRatingScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OriginalRatingScreen> {
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
