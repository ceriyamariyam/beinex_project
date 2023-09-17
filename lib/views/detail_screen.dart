import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String itemId;
  final String item1;
  final String level1;

  DetailsScreen({
    required this.id,
    required this.title,
    required this.itemId,
    required this.item1,
    required this.level1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            Text('Title: $title'),
            Text('Item ID: $itemId'),
            Text('Item 1: $item1'),
            Text('Level 1: $level1'),
            // Add more Text widgets to display other data
          ],
        ),
      ),
    );
  }
}
