import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:drawing_app/random_painter.dart';
import 'package:drawing_app/data_points.dart';
import 'package:drawing_app/array_data_point.dart';

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

class BlankEaselState extends State<BlankEasel> {
/* Animation didn't work as it runs at the frame rate of the device: 60 or 120 fps
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

  late DateTime _initialTime;
  late final Timer _timer;
  Duration _elapsed = Duration.zero;
  var arrayData = ArrayData();
  List<ArrayDataPoint> data = [];
  int height = 0;
  int width = 0;

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
    // 2. initialize it
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      // 3. get the current time
      final now = DateTime.now();
      // 4. update the state (elapsed time)
      width = MediaQuery.of(context).size.width.floor();
      height = MediaQuery.of(context).size.height.floor();

      setState(() {
        _elapsed = now.difference(_initialTime);
        debugPrint(
            "height = ${height.toString()}, width = ${width.toString()}");
        data = arrayData.getRandomStarterArray(width, height);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SizedBox.expand(
        child: CustomPaint(
          painter: RandomPainter(_elapsed, data),
          willChange: true,
          isComplex: true,
        ),
      ),
    );
  }
}

class ArrayData {
  int count = 0;
  var randomNumberGenerator = Random();
  List<ArrayDataPoint> data = [];
  int numberOfGenerations = 0;

  List<ArrayDataPoint> getArray(width, height) {
    if (numberOfGenerations == 0) {
      data = getRandomStarterArray(width, height);
      debugPrint("here");
      return data;
    } else {
      data = getNextGeneration(data, width, height);
      return data;
    }
  }

  List<ArrayDataPoint> getRandomStarterArray(width, height) {
    for (var i = 0; i < width; i++) {
      for (var j = 0; j < height; j++) {
        data.add(ArrayDataPoint(i, j, randomNumberGenerator.nextBool()));
      }
    }
    return data;
  }

  List<ArrayDataPoint> getNextGeneration(data, width, height) {
    int w = width.round();

    for (var i = 0; i < data.length; i++) {
      List<ArrayDataPoint> localArray = [];
      var trueCount = 0;

      if (!(data.elementAt(i).x == 0 ||
          data.elementAt(i).x == width - 1 ||
          data.elementAt(i).y == 0 ||
          data.elementAt(i).y == height - 1)) {
        localArray.add(ArrayDataPoint(data.elementAt(i - w - 1).x,
            data.elementAt(i - w - 1).y, data.elementAt(i - w - 1).value));
        localArray.add(ArrayDataPoint(data.elementAt(i - w).x,
            data.elementAt(i - w).y, data.elementAt(i - w).value));
        localArray.add(ArrayDataPoint(data.elementAt(i - w + 1).x,
            data.elementAt(i - w + 1).y, data.elementAt(i - w + 1).value));
        localArray.add(ArrayDataPoint(data.elementAt(i - 1).x,
            data.elementAt(i - 1).y, data.elementAt(i - 1).value));
        localArray.add(ArrayDataPoint(
            data.elementAt(i).x, data.elementAt(i).y, data.elementAt(i).value));
        localArray.add(ArrayDataPoint(data.elementAt(i + 1).x,
            data.elementAt(i + 1).y, data.elementAt(i + 1).value));
        localArray.add(ArrayDataPoint(data.elementAt(i + w - 1).x,
            data.elementAt(i + w - 1).y, data.elementAt(i + w - 1).value));
        localArray.add(ArrayDataPoint(data.elementAt(i + w).x,
            data.elementAt(i + w).y, data.elementAt(i + w).value));
        localArray.add(ArrayDataPoint(data.elementAt(i + w + 1).x,
            data.elementAt(i + w + 1).y, data.elementAt(i + w + 1).value));
      }

      for (var j = 0; j < localArray.length; j++) {
        if (localArray.elementAt(j).value) {
          trueCount++;
        }
      }

      debugPrint("truecount is ${trueCount.toString()}");

      switch (trueCount) {
        case 0:
          data.elementAt(i).value = false;
          break;
        case 1:
          data.elementAt(i).value = false;
          break;
        case 2:
          data.elementAt(i).value = false;
          break;
        case 3:
          data.elementAt(i).value = true;
          break;
        case 4:
          data.elementAt(i).value = false;
          break;
        case 5:
          data.elementAt(i).value = false;
          break;
        case 6:
          data.elementAt(i).value = false;
          break;
        case 7:
          data.elementAt(i).value = false;
          break;
        case 8:
          data.elementAt(i).value = false;
          break;
        default:
          debugPrint('woops');
      }
    }
    numberOfGenerations++;
    return data;
  }

  int getNumberOfGenerations() {
    return numberOfGenerations;
  }

  void incrementTest(c) {
    for (var i = 0; i < 20; i++) {
      debugPrint("increment test - the value is $i and ${(c++).toString()}");
    }
  }
}
