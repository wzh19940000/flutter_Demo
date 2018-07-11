// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
//import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

// TapboxA manages its own state.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  //状态组件一定要有一个createState()
  TapboxA({Key key}) : super(key: key);
  @override
  _TapboxAState createState() => _TapboxAState();
}

// class _TapboxAState extends State<TapboxA> {
//   bool _active = false;

//   void _handleTap() {
//     setState(() {
//       _active = !_active;
//     });
//   }

//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _handleTap,
//       child: Container(
//         child: Center(
//           child: Text(
//             _active ? 'Active' : 'Inactive',
//             style: TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: BoxDecoration(
//           color: _active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(color: _active ? Colors.green : Colors.grey),
      ),
    );
  }
}

//------------------------- MyApp ----------------------------------

class MyApp extends StatelessWidget {
  //无状态组件不需要createState()
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fultter demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo'),
        ),
        body: Center(
          child: TapboxA(),
        ),
      ),
    );
  }
}