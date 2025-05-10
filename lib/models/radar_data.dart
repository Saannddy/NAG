import 'package:flutter/material.dart';
import 'package:kg_charts/kg_charts.dart';

final List<RadarMapModel> radarData = [
  RadarMapModel(
    legend: [LegendModel("Nong Almond", const Color(0XFF0EBD8D))],
    indicator: [
      IndicatorModel("DEX", 100),
      IndicatorModel("LNG", 100),
      IndicatorModel("Sanity", 100),
      IndicatorModel("Charisma", 100),
      IndicatorModel("INT", 100),
    ],
    data: [
      MapDataModel([80, 60, 62, 69, 33]),
    ],
    radius: 110,
    duration: 2000,
    shape: Shape.square,
    maxWidth: 70,
    line: LineModel(4),
  ),
  RadarMapModel(
    legend: [LegendModel("Nong B", const Color(0xFF42A5F5))],
    indicator: [
      IndicatorModel("DEX", 100),
      IndicatorModel("LNG", 100),
      IndicatorModel("Sanity", 100),
      IndicatorModel("Charisma", 100),
      IndicatorModel("INT", 100),
    ],
    data: [
      MapDataModel([10, 50, 95, 22, 95]),
    ],
    radius: 110,
    duration: 2000,
    shape: Shape.square,
    maxWidth: 70,
    line: LineModel(4),
  ),
];
