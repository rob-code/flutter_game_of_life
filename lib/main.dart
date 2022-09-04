import 'package:flutter/material.dart';
import 'package:drawing_app/random_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BlankEasel(),
    );
  }
}

class BlankEasel extends StatelessWidget {
  const BlankEasel({Key? key}) : super(key: key);

  final bool hasCHanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SizedBox(
        width: 300,
        height: 300.0,
        child: CustomPaint(
          painter: RandomPainter(),
          isComplex: true,
          willChange: true,
        ),
      ),
    );
  }
}
