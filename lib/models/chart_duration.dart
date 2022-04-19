import 'package:flutter/material.dart';

class DurationData {
  String durationData;
  final String label;

  DurationData(this.durationData, this.label);

  set setDuraionData(String data) {
    durationData = data;
  }
}