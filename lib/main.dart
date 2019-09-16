import 'package:flutter/material.dart';
import 'package:image_rotate_animation/ui_pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Dart Side',
      home: HomePage(),
    );
  }
}
