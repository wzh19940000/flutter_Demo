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

class ParentWidget extends StatefulWidget {
  //状态组件一定要有一个createState()
  @override
  _ParentWidget createState() => _ParentWidget();
}

class _ParentWidget extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return new Container(
      child: new TapBoxB(active: _active, onChanged: _handleTapboxChanged),
    );
  }
}

//------------------------- MyApp ----------------------------------

// class TapBoxB extends StatelessWidget {
//   TapBoxB({Key key, this.active: false, @required this.onChanged})
//       : super(key: key);
//   //无状态组件不需要createState()
//   final bool active;
//   final ValueChanged<bool> onChanged;

//   void _handleTap() {
//     onChanged(!active);
//   }

//   @override
//   // TODO: implement widget
//   Widget build(BuildContext context) {
//     return new GestureDetector(
//       onTap: _handleTap,
//       child: new Container(
//         child: new Center(
//           child: new Text(
//             active ? 'Active' : 'Inactive',
//             style: new TextStyle(fontSize: 32.0, color: Colors.white),
//           ),
//         ),
//         width: 200.0,
//         height: 200.0,
//         decoration: new BoxDecoration(
//           color: active ? Colors.lightGreen[700] : Colors.grey[600],
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   //无状态组件不需要createState()
//   @override
//   // TODO: implement widget
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fultter demo Parent',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('flutter demo-Parent'),
//         ),
//         body: Center(
//           child: ParentWidget(),
//         ),
//       ),
//     );
//   }
// }

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  //无状态组件不需要createState()
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  //无状态组件不需要createState()
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fultter demo Parent',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter demo-Parent'),
        ),
        body: Center(
          child: ParentWidget(),
        ),
      ),
    );
  }
}
