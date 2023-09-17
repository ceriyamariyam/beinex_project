// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/provider/product_provider.dart';
import 'package:beinex_project/views/product_details_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataGrid extends StatefulWidget {
  @override
  State<MyDataGrid> createState() => _MyDataGridState();
}

class _MyDataGridState extends State<MyDataGrid> {
  bool _isLoading = true;
  List<ProductDetails>? productDetails;

  @override
  void initState() {
    super.initState();
    product();
  }

  product() async {
    print("product 1>>>>>");

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
                    return Colors
                        .blue; // Set the background color of the title row (header row) to blue
                  }),
                  border: TableBorder.all(
                      color: Colors.grey), // Add a border to the table
                  columns: [
                    DataColumn(label: Text('Id')),
                    DataColumn(label: Text('Item Id')),
                    DataColumn(label: Text('Title')),
                    DataColumn(label: Text('Date')),
                    // DataColumn(label: Text('Status')),

                    // DataColumn(
                    //   label: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text('Item Type'),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text('Item 1'),
                    //           VerticalDivider(
                    //             color: Colors
                    //                 .grey, // Choose the color of the divider
                    //             thickness:
                    //                 1.0, // Adjust the thickness as needed
                    //           ),
                    //           Text('Item 2'),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // DataColumn(
                    //   label: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Text('Levels'),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text('Level 1'),
                    //           VerticalDivider(
                    //             color: Colors
                    //                 .grey, // Choose the color of the divider
                    //             thickness:
                    //                 1.0, // Adjust the thickness as needed
                    //           ),
                    //           Text('Level 2'),
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
                      return DataRow(
                        cells: [
                          DataCell(GestureDetector(
                            onTap: (){
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
                            child: Text(currentProduct.id?.toString() ?? ""))),
                          DataCell(
                              Text(currentProduct.itemId?.toString() ?? "")),
                          DataCell(Text(currentProduct.title ?? "")),
                          DataCell(Text(currentProduct.date ?? "")),

                          //  DataCell(
                          // SizedBox(
                          //   width: 100,
                          //   child: LinearProgressIndicator(
                          //     minHeight: 10,
                          //     borderRadius: BorderRadius.circular(2),
                          //     backgroundColor: Colors.grey,
                          //     valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                          //     value: progress ?? 0.0, // Use a default value if progress is null
                          //   ),
                          // ),
                          // DataCell(
                          //   Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(currentProduct.itemType1!.value ?? ""),
                          //       VerticalDivider(
                          //         color: Colors.grey,
                          //         thickness: 1.0,
                          //       ),
                          //       Text(currentProduct.itemType2!.value ?? ""),
                          //     ],
                          //   ),
                          // ),
                          // DataCell(
                          //   Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(currentProduct.level1!.value ?? ""),
                          //       VerticalDivider(
                          //         color: Colors.grey,
                          //         thickness: 1.0,
                          //       ),
                          //       Text(currentProduct.level2!.value ?? ""),
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
