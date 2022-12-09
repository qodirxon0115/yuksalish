class Task {
  int? id;
  String? title;
  String? description;
  String? price;
  String? characteristic;
  String? category;

  // id siz oddiy konstruktor
  Task(this.title, this.description, this.price, this.characteristic, this.category);

  Task.withId(this.id, this.title, this.description, this.price, this.characteristic,
      this.category);
  // kategoriya uchun multi konstruktor
  Task.withCategory(this.category);
  // narxi bo'yicha multi konstruktor
  Task.withID(this.id,this.category);

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "title": title,
      "description": description,
      "price": price,
      "characteristic": characteristic,
      "category": category
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Task.fromMap(Map<String, Object?> map) {
    id = (map["id"] as int?)!;
    title = (map["title"] as String?)!;
    description = (map["description"] as String?)!;
    price = (map["price"] as String?)!;
    characteristic = (map["characteristic"] as String?)!;
    category = (map["category"] as String?)!;
  }

// static List<Task> myTasks = [
//   Task("task 1", "desc 1", DateTime(1, 1, 1)),
//   Task("task 2", "desc 2", DateTime(1, 1, 1)),
//   Task("task 3", "desc 3", DateTime(1, 1, 1)),
//   Task("task 4", "desc 4", DateTime(1, 1, 1)),
//   Task("task 5", "desc 5", DateTime(1, 1, 1)),
// ];
}
