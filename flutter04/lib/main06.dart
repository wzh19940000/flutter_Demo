import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('Increment'),
    );
  }
}

class CounterReduce extends StatelessWidget {
  CounterReduce({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('reduce'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => new _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  void _reduce() {
    _counter > 0
        ? setState(() {
            --_counter;
          })
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increment),
      new CounterDisplay(count: _counter),
      new CounterReduce(onPressed: _reduce),
    ]);
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //无状态组件不需要createState()
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fultter demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo 1'),
        ),
        body: Center(
          child: Counter(),
        ),
      ),
    );
  }
}
