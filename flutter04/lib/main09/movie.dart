import 'package:flutter/material.dart';

class Movie extends StatefulWidget {
  @override
  MovieState createState() => new MovieState();
}

class MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("电影"),
        ),
        body: new Center(
          child: new Text('Hello Movie'),
        ),
      ),
    );
  }
}
