import 'package:flutter/material.dart';
import 'dart:async';
import 'package:drawing_app/random_painter.dart';
import 'package:drawing_app/data_points.dart';

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

class BlankEasel extends StatefulWidget {
  const BlankEasel({super.key});

  @override
  BlankEaselState createState() => BlankEaselState();
}

class BlankEaselState extends State<BlankEasel>
    with AutomaticKeepAliveClientMixin<BlankEasel> {
/*
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
*/

  @override
  bool get wantKeepAlive => true;

  late DateTime _initialTime;
  // 1. declare a Timer
  late final Timer _timer;
  Duration _elapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    // 2. initialize it
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      // 3. get the current time
      final now = DateTime.now();
      // 4. update the state (elapsed time)
      setState(() {
        _elapsed = now.difference(_initialTime);
      });
    });
  }

  @override
  void dispose() {
    // 5. don't forget to cancel the timer
    _timer.cancel();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SizedBox.expand(
        child: CustomPaint(
          painter: RandomPainter(_elapsed),
          willChange: true,
        ),
      ),
    );
  }
}
