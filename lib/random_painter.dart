import 'package:drawing_app/array_data_point.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:drawing_app/data_points.dart';

class RandomPainter extends CustomPainter {
  final Duration elapsed;
  final arrayData = ArrayData();
  List<ArrayDataPoint> data;
  RandomPainter(this.elapsed, this.data);

  //final _blendMode = BlendMode.clear;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent.withOpacity(.99)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    debugPrint("the timer is : ${elapsed.inSeconds.toString()}");

    debugPrint(
        "size is height : ${size.height.toString()}, width : ${size.width.toString()}");

/*
    if (arrayData.numberOfGenerations == 0) {
      data = arrayData.getRandomStarterArray(size);
    } else {
      data = arrayData.getNextGeneration(data, size);
    }


   canvas.save();
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        paint..color = Colors.transparent.withOpacity(.99));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        paint..blendMode = BlendMode.clear);
    canvas.restore();


    // let's pretend this rectangle is an image.
    // in this case, we don't want anything erased from the image,
    // and we also want the image to be drawn under the eraser.
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.white);

    // after having drawn our image, we start a new layer using saveLayer().
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    // drawing the line that should be erased partially.
    canvas.drawLine(
        const Offset(100, 100),
        const Offset(200, 200),
        Paint()
          ..color = Colors.black
          ..strokeWidth = 5.0);

    // erasing parts of the first line where intersected with this line.
    canvas.drawLine(
        const Offset(100, 200),
        const Offset(200, 100),
        Paint()
          ..color = Colors.red
          ..strokeWidth = 5.0
          ..blendMode = _blendMode);

    // first composite this layer and then draw it over the previously drawn layers.
    canvas.restore();

    debugPrint(
        "number of items on the saveStack = ${canvas.getSaveCount().toString()}");

*/

    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());

    for (var i = 0; i < data.length; i++) {
      if (data.elementAt(i).value) {
        canvas.drawCircle(
            Offset(
                data.elementAt(i).x.toDouble(), data.elementAt(i).y.toDouble()),
            .5,
            paint..color = Colors.redAccent);
      }
    }

    canvas.restore();
    /*
      else {
        canvas.drawCircle(
            Offset(
                data.elementAt(i).x.toDouble(), data.elementAt(i).y.toDouble()),
            .5,
            paint..color = Colors.white);
      }
    }

*/

    //canvas.saveLayer((null), paint..blendMode = BlendMode.difference);
  }

  @override
  bool shouldRepaint(RandomPainter oldDelegate) => true;
}
