
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:beinex_project/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomVerticalBarChart extends StatefulWidget {
  @override
  State<CustomVerticalBarChart> createState() => _CustomVerticalBarChartState();
}

class _CustomVerticalBarChartState extends State<CustomVerticalBarChart> {
    bool isLoading = true;

  List<ProductDetails>? productDetails;

   final List<ChartData> chartData = [
    ChartData('Category 1', 25),
    ChartData('Category 2', 40),
    ChartData('Category 3', 30),
    ChartData('Category 4', 45),
  ];

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
           padding: EdgeInsets.only(left: 20,top: 20),
           child: Text(
                    'Title',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromRGBO(0, 59, 109, 1.0)),
                    textAlign: TextAlign.center,
                  ),
         ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SfCartesianChart(

            plotAreaBorderWidth: 0, 
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              axisLine: AxisLine(width: 0),
              labelPosition: ChartDataLabelPosition.outside, 
              labelIntersectAction: AxisLabelIntersectAction.none, 
              majorTickLines: MajorTickLines(size: 0), 
              minorTickLines: MinorTickLines(size: 0), 
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              axisLine: AxisLine(width: 0),
              //labelPosition: ChartDataLabelPosition.outside,
                             // labelPosition: ChartDataLabelPosition.none,
                             labelIntersectAction: AxisLabelIntersectAction.none, 

           maximumLabelWidth: 0,
              majorTickLines: MajorTickLines(size: 0), 
              minorTickLines: MinorTickLines(size: 0), 
            ),
            series: <ChartSeries>[
              BarSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                color: Colors.red,
                width: 0.5, 
                borderRadius: BorderRadius.circular(5.0), 
                dataLabelSettings: DataLabelSettings(
                  isVisible: true, 
                  labelPosition: ChartDataLabelPosition.outside, 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}