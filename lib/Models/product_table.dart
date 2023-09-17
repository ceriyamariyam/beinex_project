
class ProductTable {
  String id;
  String itemId;
  String title;
  DateTime date;
  double progressValue;
  String item1;
  String item2;
  String level1;
  String level2;

  ProductTable({
    required this.id,
    required this.itemId,
    required this.title,
    required this.date,
    required this.progressValue,
    required this.item1,
    required this.item2,
    required this.level1,
    required this.level2,
  });

  factory ProductTable.fromJson(Map<String, dynamic> json) {
    return ProductTable(
      id: json['id'] ?? '',
      itemId: json['itemId'] ?? '',
      title: json['title'] ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      progressValue: (json['progressValue'] ?? 0.0).toDouble(),
      item1: json['item1'] ?? '',
      item2: json['item2'] ?? '',
      level1: json['level1'] ?? '',
      level2: json['level2'] ?? '',
    );
  }
}