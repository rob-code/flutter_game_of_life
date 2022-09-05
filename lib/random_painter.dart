import 'package:drawing_app/array_data_point.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:drawing_app/data_points.dart';

class RandomPainter extends CustomPainter {
  final Duration elapsed;
  RandomPainter(this.elapsed);
  final arrayData = ArrayData();
  List<ArrayDataPoint> data = [];
  int count = 0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

/*
    if (arrayData.numberOfGenerations == 0) {
      data = arrayData.getRandomStarterArray(size);
    } else {
      data = arrayData.getNextGeneration(data, size);
    }
*/

    data = arrayData.getArray(size);
    debugPrint("the timer is : ${elapsed.inSeconds.toString()}");
    debugPrint("data is : ${data.length.toString()}");

    for (var i = 0; i < data.length; i++) {
      if (data.elementAt(i).value) {
        canvas.drawCircle(
            Offset(
                data.elementAt(i).x.toDouble(), data.elementAt(i).y.toDouble()),
            .5,
            paint);
      }
    }
    count++;
  }

  @override
  bool shouldRepaint(covariant RandomPainter oldDelegate) => true;
}
