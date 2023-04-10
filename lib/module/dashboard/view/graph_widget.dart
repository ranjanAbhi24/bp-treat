import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphWidget extends StatelessWidget {
  final List<BarChartGroupData> showingBarGroups;
  final Widget Function(double, TitleMeta)? getTitlesWidget;
  const BarGraphWidget(
      {super.key,
      required this.showingBarGroups,
      required this.getTitlesWidget});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(
            border: const Border(
          top: BorderSide.none,
          right: BorderSide.none,
          left: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
        )),
        maxY: 250,
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitlesWidget,
            ),
          ),
        ),
        gridData: FlGridData(
          show: false,
        ),
        alignment: BarChartAlignment.spaceEvenly,
        barGroups: showingBarGroups,
      ),
    );
  }
}
