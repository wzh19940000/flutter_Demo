import 'package:flutter/material.dart';
import 'main09/book.dart';
import 'main09/movie.dart';
import 'main09/music.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new PageView(
          // controller: controller,
          children: [
            new Movie(),
            new Book(),
            new Music(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              title: Text('电影'),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('图书'),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('音乐'),
              backgroundColor: Colors.grey),
        ], onTap: onTap, currentIndex: page),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
