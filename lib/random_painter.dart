import 'package:drawing_app/array_data_point.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:drawing_app/array_data.dart';

class RandomPainter extends CustomPainter {
  RandomPainter() : super();

  final arrayData = ArrayData();
  List<ArrayDataPoint> data = [];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    debugPrint(
        "number of generations = ${arrayData.numberOfGenerations.toString()}");

    var rect = Rect.fromCenter(
        center: const Offset(0, 0), width: size.width, height: size.height);

    if (arrayData.numberOfGenerations == 0) {
      data = arrayData.getRandomStarterArray(size);
      debugPrint("getting random starter array");
    } else {
      data = arrayData.getNextGeneration(data, size);
      debugPrint("getting next generation");
    }

    canvas.drawRect(rect, paint);

    for (var i = 0; i < data.length; i++) {
      if (data.elementAt(i).value) {
        canvas.drawCircle(
            Offset(
                data.elementAt(i).x.toDouble(), data.elementAt(i).y.toDouble()),
            .5,
            paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant RandomPainter oldDelegate) => true;
}

/*
@override
bool? hitTest(Offset position) {
  return rect.contains(position);
}
*/
