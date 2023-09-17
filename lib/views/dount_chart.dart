// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomDonutChart extends StatefulWidget {
  @override
  State<CustomDonutChart> createState() => _CustomDonutChartState();
}

class _CustomDonutChartState extends State<CustomDonutChart> {
  @override
  void initState() {
    super.initState();
  }

  List<ProductDetails>? productDetails;


  final List<CategoryData> data = [
    CategoryData('Category A', 30, Colors.blue),
    CategoryData('Category B', 20, Colors.green),
    CategoryData('Category C', 25, Colors.orange),
    CategoryData('Category D', 15, Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.only(left: 20,top: 20),
               child: Text(
                        'Title',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromRGBO(0, 59, 109, 1.0)),
                        textAlign: TextAlign.center,
                      ),
             ),
            SfCircularChart(
              annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(
                  widget: Center(
                    child: Text(
                      'Total\n70',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              series: <CircularSeries>[
                DoughnutSeries<CategoryData, String>(
                  innerRadius: '75%',
                  // cornerStyle: CornerStyle.bothFlat,
                  //   explode:true,
                  //  explodeAll: true,
                  dataSource: data,
                    pointColorMapper: (CategoryData data, _) => data.color,
            xValueMapper: (CategoryData data, _) => data.x,
            yValueMapper: (CategoryData data, _) => data.y,
                  dataLabelSettings: DataLabelSettings(
                    isVisible: false,
                    labelPosition: ChartDataLabelPosition.inside,

                    // labelAlign: ChartDataLabelAlignment.center,
                    //labelStyle: TextStyle(fontSize: 12),
                  ),
                ),
              ],
              legend: Legend(
                isVisible: true,
                position: LegendPosition.right,
                // overflowMode: LegendItemOverflowMode.wrap,
              ),
            ),
          ],
        ),
      
    );
  }
}

class CategoryData {
  final String x;
  final double y;
  final Color color;

  CategoryData(this.x, this.y, this.color);
}
