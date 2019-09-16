import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Offset _offset = Offset.zero;
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this)
          ..addListener(() {
            setState(() {
              _offset += Offset(0.0142, 0.0);
            });
          });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Dart Side',
          style: TextStyle(
            color: Colors.blueGrey[400],
            fontFamily: 'STARWARS',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(_offset.dx),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details) => setState(() {
              _offset += details.delta;
              print(_offset);
            }),
            onDoubleTap: () => setState(() => _offset = Offset.zero),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/dash.png'),
              ),
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
