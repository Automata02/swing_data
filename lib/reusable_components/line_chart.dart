import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class SwingLineChart extends StatelessWidget {
  final List<double> flexionExtension;
  final List<double> ulnarRadial;

  const SwingLineChart({
    super.key,
    required this.flexionExtension,
    required this.ulnarRadial,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          minY: -40,
          maxY: 40,
          lineBarsData: [
            LineChartBarData(
              spots: flexionExtension
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              color: CupertinoColors.systemOrange,
              dotData: const FlDotData(show: false),
              isCurved: true,
              curveSmoothness: 1,
              barWidth: 3,
            ),
            LineChartBarData(
              spots: ulnarRadial
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value))
                  .toList(),
              color: CupertinoColors.systemCyan,
              dotData: const FlDotData(show: false),
              isCurved: true,
              curveSmoothness: 1,
              barWidth: 3,
            ),
          ],
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 40),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}