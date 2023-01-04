import 'dart:convert';

class ProductList {
  String? title;
  bool? like;
  String? price;
  String? model;
  String? category;
  String? description;
  String? charecteristics;
  String? id;
  String? sort;
  String? image;

  ProductList(
      {this.title,
        this.model,
        this.like,
        this.price,
        this.category,
        this.description,
        this.charecteristics,
        this.id,
        this.image,
        this.sort});

  ProductList.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    like = json['like'];
    price = json['price'];
    model = json['model'];
    category = json['category'];
    description = json['description'];
    charecteristics = json['charecteristics'];
    id = json['id'];
    image = json['image'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['like'] = this.like;
    data['model'] = this.model;
    data['price'] = this.price;
    data['category'] = this.category;
    data['description'] = this.description;
    data['charecteristics'] = this.charecteristics;
    data['id'] = this.id;
    data['image'] = this.image;
    data['sort'] = this.sort;
    return data;
  }
}

class MyDataClass {
  final String title;
  final String content;

  MyDataClass({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'content': content});

    return result;
  }

  factory MyDataClass.fromMap(Map<String, dynamic> map) {
    return MyDataClass(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MyDataClass.fromJson(String source) => MyDataClass.fromMap(json.decode(source));
}
