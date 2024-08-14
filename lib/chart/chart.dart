import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class  MyPieChart{

  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        color: Color.fromARGB(255, 15, 103, 16),
        value: 15,
        title: '15%',
        titleStyle:const TextStyle(
          color: Colors.white
        ),
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 40,
        title: '40%',
        titleStyle:const TextStyle(
          color: Colors.white
        ),
        radius: 50,
      ),
      PieChartSectionData(
        color: Color.fromARGB(255, 3, 19, 124),
        value: 10,
        title: '10%',
        titleStyle:const TextStyle(
          color: Colors.white
        ),
        radius: 50,
      ),
      PieChartSectionData(
        color: Colors.yellow,
        value: 5,
        title: '5%',
        titleStyle:const TextStyle(
          color: Colors.white
        ),
        radius: 50,
      ),
    ];
  }

  Widget buildPieChart() {
    return PieChart(
      PieChartData(
        sections: getSections(),
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }
}
