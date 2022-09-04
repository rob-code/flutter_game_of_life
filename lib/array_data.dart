import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:math';
import 'package:drawing_app/array_data_point.dart';

class ArrayData {
  var randomNumberGenerator = Random();
  List<ArrayDataPoint> data = [];
  int numberOfGenerations = 0;

  List<ArrayDataPoint> getRandomStarterArray(size) {
    debugPrint("width, height = $size");
    debugPrint(
        "number of pixels = ${size.width.round() * size.height.round()}");
    //debugPrint("longest side = " + size.longestSide.toString());
    //debugPrint("shortest side = " + size.shortestSide.toString());

    for (var i = 0; i < size.width; i++) {
      for (var j = 0; j < size.height; j++) {
        data.add(ArrayDataPoint(i, j, randomNumberGenerator.nextBool()));
      }
    }
    numberOfGenerations++;
    return data;
  }

  List<ArrayDataPoint> getNextGeneration(data, size) {
    //      debugPrint("x = ${data.elementAt(i).x}, y = ${data.elementAt(i).y}, value = ${data.elementAt(i).value}");

    int w = size.width.round();
    //debugPrint("the width as an integer = $w and its type is ${w.runtimeType}");

    for (var i = 249120; i < data.length; i++) {
      List<ArrayDataPoint> localArray = [];
      var trueCount = 0;

      if (!(data.elementAt(i).x == 0 ||
          data.elementAt(i).x == size.width - 1 ||
          data.elementAt(i).y == 0 ||
          data.elementAt(i).y == size.height - 1)) {
        //need to check this!!!!!
        //debugPrint("data length is ${data.length.toString()}");
        //debugPrint("i is ${i.toString()}");

        // if (i >= data.length - w - 1400) {
        //   debugPrint("x = ${data.elementAt(i).x}, y = ${data.elementAt(i).y}, value = ${data.elementAt(i).value}");
        // }

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
}
