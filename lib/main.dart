import 'package:beinex_project/provider/product_provider.dart';
import 'package:beinex_project/views/product_details_graph.dart';
import 'package:beinex_project/views/table_1.dart';
import 'package:beinex_project/views/table_sample.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: //CustomVerticalBarChart(), 
        // CustomDonutChart(),
     //  TableScreen(),
      // ProductDetailsGraphScreen(),
     MyDataGrid()
      ),
    );
  }
}

