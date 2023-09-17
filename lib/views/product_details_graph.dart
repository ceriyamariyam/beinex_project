// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/views/widgets/bar_chart_widget.dart';
import 'package:beinex_project/views/widgets/dount_chart.dart';
import 'package:flutter/material.dart';

class ProductDetailsGraphScreen extends StatelessWidget {
  final String id;
  final String title;
  final ItemType1? itemType1;
  final ItemType1? itemType2;
  const ProductDetailsGraphScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.itemType1,
      required this.itemType2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(51, 131, 135, 1.0),
                  Color.fromRGBO(16, 34, 35, 1.0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      id,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(title,
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ]),
            ),
          ),
          //Bar chart
          CustomVerticalBarChart(),
          //Donut chart
          CustomDonutChart(),
        ]),
      ),
    );
  }
}
