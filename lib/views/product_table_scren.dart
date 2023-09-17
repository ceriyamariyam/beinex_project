// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/provider/product_provider.dart';
import 'package:beinex_project/uitls/common/table_common_widgets.dart';
import 'package:beinex_project/views/product_details_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTableScreen extends StatefulWidget {
  @override
  State<ProductTableScreen> createState() => _ProductTableScreenState();
}

class _ProductTableScreenState extends State<ProductTableScreen> {
  bool _isLoading = true;
  List<ProductDetails>? productDetails;

  @override
  void initState() {
    super.initState();
    product();
  }

  product() async {
    final details =
        await Provider.of<ProductProvider>(context, listen: false).fetch();

    if (details != null) {
      setState(() {
        productDetails = details;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) {
                    return Color(0xFF003b6d);
                  }),
                  border: TableBorder.all(color: Colors.grey),
                  columns: [
                    DataColumn(
                        label: Text(
                      'Id',
                      style: TextStyle(color: Colors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Item Id',
                      style: TextStyle(color: Colors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Title',
                      style: TextStyle(color: Colors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Date',
                      style: TextStyle(color: Colors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Status',
                      style: TextStyle(color: Colors.white),
                    )),
                    DataColumn(
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Item Type',
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item 1',
                                style: TextStyle(color: Colors.white),
                              ),
                            VerticalDivider(color: Colors.grey,),
                              Text(
                                'Item 2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // DataColumn(
                    //   label: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text('Levels',style: TextStyle(color: Colors.white),),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text('Level 1',style: TextStyle(color: Colors.white),),
                    //           VerticalDivider(
                    //             color: Colors
                    //                 .grey, // Choose the color of the divider
                    //             thickness:
                    //                 1.0, // Adjust the thickness as needed
                    //           ),
                    //           Text('Level 2',style: TextStyle(color: Colors.white),),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                  rows: List<DataRow>.generate(
                    productDetails!.length,
                    (index) {
                      final currentProduct = productDetails![index];
                      double progress =
                          currentProduct.status?.totalCount == null ||
                                  currentProduct.status!.totalCount == 0
                              ? 0.0
                              : currentProduct.status!.currentCount! /
                                  currentProduct.status!.totalCount!;

                      return DataRow(
                        onLongPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsGraphScreen(
                                id: currentProduct.itemId.toString(),
                                title: currentProduct.title.toString(),
                                itemType1: currentProduct.itemType1,
                                itemType2: currentProduct.itemType2,
                              ),
                            ),
                          );
                        },
                        color: MaterialStateColor.resolveWith((states) {
                          return currentProduct.active ?? false
                              ? Colors.white
                              : Colors.grey;
                        }),
                        cells: [
                          DataCell(GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsGraphScreen(
                                      id: currentProduct.itemId.toString(),
                                      title: currentProduct.title.toString(),
                                      itemType1: currentProduct.itemType1,
                                      itemType2: currentProduct.itemType2,
                                    ),
                                  ),
                                );
                              },
                              child:
                                  Text(currentProduct.id?.toString() ?? ""))),
                          DataCell(
                              Text(currentProduct.itemId?.toString() ?? "")),
                          DataCell(Text(currentProduct.title ?? "")),
                          DataCell(DatePickerCell(
                            initialDate: currentProduct.date ?? "",
                            overdue: currentProduct.overdue ?? true,
                          )),
                          DataCell(
                            SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                minHeight: 20,
                                borderRadius: BorderRadius.circular(4),
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFB14C4C)),
                                value: progress,
                              ),
                            ),
                          ),
                          DataCell(
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(currentProduct.itemType1?.value ?? ""),
                                Text(currentProduct.itemType2?.value ?? ""),
                              ],
                            ),
                          ),
                          // DataCell(
                          //   Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(currentProduct.level1?.value ??
                          //           ""), // Use ?. here
                          //       VerticalDivider(
                          //         color: Colors.grey,
                          //         thickness: 1.0,
                          //       ),
                          //       Text(currentProduct.level2?.value ??
                          //           ""), // Use ?. here
                          //     ],
                          //   ),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
