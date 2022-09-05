import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:math';
import 'package:drawing_app/array_data_point.dart';

class ArrayData {
  var randomNumberGenerator = Random();
  List<ArrayDataPoint> data = [];
  int numberOfGenerations = 0;
  List<ArrayDataPoint> getRandomStarterArray(size) {
    for (var i = 0; i < size.width; i++) {
      for (var j = 0; j < size.height; j++) {
        data.add(ArrayDataPoint(i, j, randomNumberGenerator.nextBool()));
      }
    }
    numberOfGenerations++;
    debugPrint("got here ${numberOfGenerations.toString()}");
    return data;
  }

  List<ArrayDataPoint> getNextGeneration(data, size) {
    int w = size.width.round();

    for (var i = 249120; i < data.length; i++) {
      List<ArrayDataPoint> localArray = [];
      var trueCount = 0;

      if (!(data.elementAt(i).x == 0 ||
          data.elementAt(i).x == size.width - 1 ||
          data.elementAt(i).y == 0 ||
          data.elementAt(i).y == size.height - 1)) {
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

  void incrementTest(c) {
    for (var i = 0; i < 20; i++) {
      debugPrint("increment test - the value is $i and ${(c++).toString()}");
    }
  }
}
