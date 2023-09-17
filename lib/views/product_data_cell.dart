


import 'package:beinex_project/Models/product_model.dart';
import 'package:beinex_project/uitls/common/table_common_widgets.dart';
import 'package:flutter/material.dart';

class MyData extends DataTableSource {

  final List<ProductDetails>? products;
 

  MyData(
      {
        this.products});

  bool get isRowCountApproximate => false;

  int get rowCount => products!.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    final product = products![index];
  final currentCount = product.status?.currentCount ?? 0;
  final totalCount = product.status?.totalCount ?? 1; // Ensure totalCount is not 0 to avoid division by zero

  final progressValue = currentCount / totalCount;

  print("Progress Value for item at index $index: $progressValue");
    return DataRow.byIndex(
      index: index,
      color: MaterialStateColor.resolveWith((states) {
        if (index % 2 == 0) {
          return Colors.grey.withOpacity(0.3);
        } else {
          return Colors.transparent;
        }
      }),
      cells: [
        DataCell(
          Text(
            '${index + 1}',
          ),
        ),
        DataCell(
          Text(
            products![index].id.toString(),
            maxLines: 2,
          ),
        ),
        DataCell(Text(
          '${products![index].itemId} ',
        )),
        DataCell(Text(
          '${products![index].title} ',
        )),

              //   DataCell(DatePickerCell(products[index].date.toDateTime() ,overdue: products![index].overdue,)),

          //      DataCell(
          //   SizedBox(
          //     width: 100,
          //     child: LinearProgressIndicator(
          //       minHeight: 10,
          //       borderRadius: BorderRadius.circular(2),
          //       backgroundColor: Colors.grey,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          //       value: products?[index].status?.currentCount /
          //           products?[index].status!.totalCount,
          //     ),
          //   ),
          // ),
        // DataCell(
        //   Text(products![index].productID.toString()),
        // ),
      ],
    );
  }
}