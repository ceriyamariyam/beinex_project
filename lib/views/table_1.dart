// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:beinex_project/provider/product_provider.dart';
import 'package:beinex_project/uitls/common/table_common_widgets.dart';
import 'package:beinex_project/views/product_details_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  // Initialize the productDetails and isLoading variables
  List<Map<String, dynamic>> productDetails = [];
  bool isLoading = true;
  DateTime? date;
  @override
  void initState() {
    // Fetch product details when the widget is initialized
    fetchProductDetails();
    super.initState();
  }

  void fetchProductDetails() async {
    try {
      final details =
          await Provider.of<ProductProvider>(context, listen: false).fetch();

      if (details != null) {
        final provider = Provider.of<ProductProvider>(context, listen: false);

        setState(() {
          // Convert ProductDetails objects to the desired map format
          productDetails = details.map((item) {
            provider.addToSelected(item);
            date =
                item.date != null ? DateTime.tryParse(item.date ?? "") : null;
            print("Overdue::${date}");

            return {
              'id': item.id.toString(),
              'itemId': item.itemId.toString(),
              'title': item.title.toString(),
              'overdue': item.overdue,
              //  'date': item.date,
              // 'progressValue': item.status?.currentCount != null &&
              //     item.status?.totalCount != null
              //         ? (item.status!.currentCount! / item.status!.totalCount!)
              //             .toDouble()
              //         : 0.0,
              // 'item1': item.itemType1?.value.toString(),
              // 'item2': item.itemType2?.value.toString(),
              'level1': item.level1![0].value.toString(),
              'level2': item.level2!.isNotEmpty
                  ? item.level2![0].value.toString()
                  : '',
            };
          }).toList();
          isLoading = false;
          print("Success");
        });
      } else {
        print("Details is null");
      }
    } catch (error) {
      print("Error fetching product details: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);

    // Define your DataTable rows using the productDetails data
    List<DataRow> dataRows = productDetails.map((item) {
      //provider.addToSelected()
      return DataRow(
        cells: [
          DataCell(GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => ProductDetailsGraphScreen(
                //       id: item['id'].toString(),
                //       title: item['title'].toString(),
                //     ),
                //   ),
                // );

                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => DetailsScreen(
                //       id: item['id'].toString(),
                //       title: item['title'].toString(),
                //       itemId: item['itemId'].toString(),
                //       item1: item['item1'].toString(),
                //       level1: item['level1'].toString(),
                //     ),
                //   ),
                // );
              },
              child: Text(item['id'].toString()))),
          DataCell(Text(item['itemId'].toString())),
          DataCell(Text(item['title'].toString())),
          // DataCell(
          //   Text(
          //     DateFormat('yyyy-MM-dd').format(item['date']),
          //   ),
          // ),
          if (date != null)
            DataCell(DatePickerCell(
              initialDate: date!,
              overdue: item['overdue'],
            )),
          //  DataCell(  Text(
          //         DateFormat('yyyy-MM-dd').format(date!),
          //         style: TextStyle(fontSize: 12, color: Colors.grey),
          //       ),),

          // DataCell(
          //   SizedBox(
          //     width: 100,
          //     child: LinearProgressIndicator(
          //       minHeight: 10,
          //       borderRadius: BorderRadius.circular(2),
          //       backgroundColor: Colors.grey,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          //       value: item['status']['current_count'] /
          //           item['status']['total_count'],
          //     ),
          //   ),
          // ),
          DataCell(
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['item1'].toString()),
                VerticalDivider(
                  color: Colors.grey,
                  thickness: 1.0,
                ),
                Text(item['item2'].toString()),
              ],
            ),
          ),
          // DataCell(
          //   Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(item['level1'].toString()),
          //       VerticalDivider(
          //         color: Colors.grey,
          //         thickness: 1.0,
          //       ),
          //       Text(item['level2'].toString()),
          //     ],
          //   ),
          // ),
        ],
      );
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
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
                    DataColumn(
                      label: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Item Type'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Item 1'),
                              VerticalDivider(
                                color: Colors
                                    .grey, // Choose the color of the divider
                                thickness:
                                    1.0, // Adjust the thickness as needed
                              ),
                              Text('Item 2'),
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
                  rows: dataRows,
                ),
              ),
      ),
    );
  }
}
