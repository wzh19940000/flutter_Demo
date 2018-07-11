import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  @override
  MusicState createState() => new MusicState();
}

class MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("音乐"),
        ),
        body: new Center(
          child: new Text('Hello Music'),
        ),
      ),
    );
  }
}
