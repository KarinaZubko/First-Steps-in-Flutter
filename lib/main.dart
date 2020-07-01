import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MaterialApp(
  home: MainVidget()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainVidget();
  }
}

class MainVidget extends StatefulWidget {
  @override
  MainVidgetState createState() => MainVidgetState();
}

class MainVidgetState extends State<MainVidget> {
  Color mainColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: mainColor,
          appBar: AppBar(
              centerTitle: true,
              title: Text('Test Task by Karina Z', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Consolas', fontSize: 36),),
              backgroundColor: Color(0xFFFDD835),
            ),
          body: Stack(
          children: <Widget>[
          Center(
          child: Text('Hi there', style: TextStyle(fontSize: 36)),
          ),
            
    Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (e) {
        setState(() {
          mainColor = Color.fromARGB(Random().nextInt(254) + 1,
              Random().nextInt(254) + 1, Random().nextInt(254) + 1, 1);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

