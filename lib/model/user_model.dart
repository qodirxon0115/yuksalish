

class User{

  late String name;
  late String address;
  late String phone;
  late String password;
  late String password1;

  User({required this.name,required this.address,
    required this.phone,required this.password,required this.password1,});
  User.from({required this.name, required this.address,
    required this.phone, required this.password, required this.password1});

  User.fromJson(Map<String, dynamic>json)
      : name = json["F.I.O"],
        address = json["address"],
        phone = json["phone"],
        password = json["password"],
        password1 = json["password"];

  Map<String, dynamic> toJson() => {
    "F.I.O": name,
    "address": address,
    "phone": phone,
    "password": password,
    "password1": password1,
  };

}