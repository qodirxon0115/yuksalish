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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['like'] = like;
    data['model'] = model;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['charecteristics'] = charecteristics;
    data['id'] = id;
    data['image'] = image;
    data['sort'] = sort;
    return data;
  }
}




CategoryList productListFromJson(String str) =>
    CategoryList.fromJson(json.decode(str));

String productListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  CategoryList({
    Title? title,
    bool? like,
    String? price,
    String? model,
    String? category,
    String? description,
    String? charecteristics,
    String? id,
    String? sort,
    String? image,
  }) {
    _like = like;
    _price = price;
    _model = model;
    _category = category;
    _description = description;
    _charecteristics = charecteristics;
    _id = id;
    _sort = sort;
    _image = image;
    _title = title;
  }

  CategoryList.fromJson(dynamic json) {
    _like = json['like'];
    _price = json['price'];
    _model = json['model'];
    _category = json['category'];
    _description = json['description'];
    _charecteristics = json['charecteristics'];
    _id = json['id'];
    _sort = json['sort'];
    _image = json['image'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  bool? _like;
  String? _price;
  String? _model;
  String? _category;
  String? _description;
  String? _charecteristics;
  String? _id;
  String? _sort;
  String? _image;
  Title? _title;

  CategoryList copyWith({
    bool? like,
    String? price,
    String? model,
    String? category,
    String? description,
    String? charecteristics,
    String? id,
    String? sort,
    String? image,
    Title? title,
  }) =>
      CategoryList(
        image: image ?? _image,
        title: title ?? _title,
        like: like ?? _like,
        price: price ?? _price,
        model: model ?? _model,
        category: category ?? _category,
        description: description ?? _description,
        charecteristics: charecteristics ?? _charecteristics,
        id: id ?? _id,
        sort: sort ?? _sort,
      );

  bool? get like => _like;
  String? get price => _price;
  String? get model => _model;
  String? get category => _category;
  String? get description => _description;
  String? get charecteristics => _charecteristics;
  String? get id => _id;
  String? get sort => _sort;
  String? get image => _image;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['like'] = _like;
    map['price'] = _price;
    map['model'] = _model;
    map['category'] = _category;
    map['charecteristics'] = _charecteristics;
    map['id'] = _id;
    map['sort'] = _sort;
    map['image'] = _image;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }
}

/// title : "title"

Title titleFromJson(String str) => Title.fromJson(json.decode(str));



String titleToJson(Title data) => json.encode(data.toJson());

class Title {
  Title({
    String? title,
    String? price,
    ListOne? list,

  }) {
    _title = title;
    _price = price;
    _list = list;
  }

  Title.fromJson(dynamic json) {
    _title = json['title'];
    _price = json['price'];
    _list = json['list'] != null ? ListOne.fromJson(json['list']) : null;
  }

  String? _title;
  String? _price;
  ListOne? _list;

  Title copyWith({
    ListOne? list,
    String? title,
    String? price,

  }) =>
      Title(
        title: title ?? _title,
        price: price ?? _price,
        list: list ?? _list,
      );

  String? get title => _title;
  String? get price => _price;
  ListOne? get name => _list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['price'] = _price;
    if (_list != null) {
      map['list'] = _list?.toJson();
    }
    return map;
  }
}
class ListOne {
  ListOne({
    String? name,
    String? price,
  }) {
    _name = name;
    _price =price;
  }

  ListOne.fromJson(dynamic json) {
    _name = json['name'];
    _price = json['price'];

  }

  String? _name;
  String? _price;

  ListOne copyWith({
    String? name,
    String? price,
  }) =>
      ListOne(
        name: name ?? _name,
        price: price ?? _price,
      );

  String? get name => _name;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    return map;
  }
}
ListOne listOneFromJson(String str) => ListOne.fromJson(json.decode(str));

String listOneToJson(Title data) => json.encode(data.toJson());


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
