import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<PieChartSectionData> getSectionData(double getScreenWidth) {
  double radius = getScreenWidth / 4.4;
  return [
    PieChartSectionData(
      value: 20,
      title: 'Food: 20%',
      radius: radius,
      color: Color.fromARGB(255, 126, 32, 155),
    ),
    PieChartSectionData(
      value: 35,
      title: 'Entertainment: 35%',
      radius: radius,
      color: Color.fromARGB(255, 78, 222, 133),
    ),
    PieChartSectionData(
      value: 15,
      title: 'Transportation: 15%',
      radius: radius,
      color: Color.fromARGB(255, 31, 152, 228),
    ),
    PieChartSectionData(
      value: 20,
      title: 'Utilities: 30%',
      radius: radius,
      color: Color.fromARGB(255, 86, 56, 196),
    ),
    PieChartSectionData(
        value: 10,
        title: 'Other: %10',
        radius: radius,
        color: Color.fromARGB(255, 209, 61, 212)),
  ];
}