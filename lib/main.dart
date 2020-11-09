import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heart',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

Widget _image(String asset) {
  return Image.asset(
    asset,
    height: 30.0,
    width: 30.0,
    color: Colors.amber,
  );
}

class HomePage extends StatelessWidget {
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
            Text("❤　❤　❤　❤　❤"),
            RatingBar(
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: _image('assets/heart.png'),
                half: _image('assets/heart_half.png'),
                empty: _image('assets/heart_border.png'),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
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
