class ProductDetails {
  int? id;
  String? title;
  String? itemId;
  bool? active;
  String? date;
  bool? overdue;
  ItemType1? itemType1;
  ItemType1? itemType2;
  List<Level1>? level1;
  List<Level2>? level2;
  Status? status;

  ProductDetails(
      {this.id,
      this.title,
      this.itemId,
      this.active,
      this.date,
      this.overdue,
      this.itemType1,
      this.itemType2,
      this.level1,
      this.level2,
      this.status});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    itemId = json['item_id'];
    active = json['active'];
    date = json['date'];
    overdue = json['overdue'];
    itemType1 = json['item_type1'] != null
        ? new ItemType1.fromJson(json['item_type1'])
        : null;
    itemType2 = json['item_type2'] != null
        ? new ItemType1.fromJson(json['item_type2'])
        : null;
    if (json['level1'] != null) {
      level1 = <Level1>[];
      json['level1'].forEach((v) {
        level1!.add(new Level1.fromJson(v));
      });
    }
    if (json['level2'] != null) {
      level2 = <Level2>[];
      json['level2'].forEach((v) {
        level2!.add(new Level2.fromJson(v));
      });
    }
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['item_id'] = this.itemId;
    data['active'] = this.active;
    data['date'] = this.date;
    data['overdue'] = this.overdue;
    if (this.itemType1 != null) {
      data['item_type1'] = this.itemType1!.toJson();
    }
    if (this.itemType2 != null) {
      data['item_type2'] = this.itemType2!.toJson();
    }
    if (this.level1 != null) {
      data['level1'] = this.level1!.map((v) => v.toJson()).toList();
    }
    if (this.level2 != null) {
      data['level2'] = this.level2!.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class ItemType1 {
  String? value;
  String? color;

  ItemType1({this.value, this.color});

  ItemType1.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['color'] = this.color;
    return data;
  }
}

class Status {
  int? currentCount;
  int? totalCount;

  Status({this.currentCount, this.totalCount});

  Status.fromJson(Map<String, dynamic> json) {
    currentCount = json['current_count'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_count'] = this.currentCount;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Level1 {
	String? value;
	String? color;

	Level1({this.value, this.color});

	Level1.fromJson(Map<String, dynamic> json) {
		value = json['value'];
		color = json['color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['value'] = this.value;
		data['color'] = this.color;
		return data;
	}
}

class Level2 {
	String? value;
	String? color;

	Level2({this.value, this.color});

	Level2.fromJson(Map<String, dynamic> json) {
		value = json['value'];
		color = json['color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['value'] = this.value;
		data['color'] = this.color;
		return data;
	}
}