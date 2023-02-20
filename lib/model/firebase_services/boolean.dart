import 'dart:convert';

/// image_url : true
/// title : {"title":"title"}

Boolean booleanFromJson(String str) => Boolean.fromJson(json.decode(str));

String booleanToJson(Boolean data) => json.encode(data.toJson());

class Boolean {
  Boolean({
    bool? imageUrl,
    Title? title,
  }) {
    _imageUrl = imageUrl;
    _title = title;
  }

  Boolean.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }

  bool? _imageUrl;
  Title? _title;

  Boolean copyWith({
    bool? imageUrl,
    Title? title,
  }) =>
      Boolean(
        imageUrl: imageUrl ?? _imageUrl,
        title: title ?? _title,
      );

  bool? get imageUrl => _imageUrl;

  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = _imageUrl;
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
  }) {
    _title = title;
  }

  Title.fromJson(dynamic json) {
    _title = json['title'];
  }

  String? _title;

  Title copyWith({
    String? title,
  }) =>
      Title(
        title: title ?? _title,
      );

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    return map;
  }
}

// Column(
// children: [
// SizedBox(
// height: size.height * 0.5,
// child: Form(
// key: _keyDialogForm,
// child: SizedBox(
// height: size.height * 0.25,
// width: size.width * 0.7,
// child: Column(
// children: [
// TextFormField(
// keyboardType: TextInputType.name,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius:
// BorderRadius.circular(35),
// ),
// labelText: "Nomi",
// ),
// validator: (value) {
// if (value != null && value
//     .isEmpty) {
// return "To'ldirilmagan";
// }
// return null;
// },
// onSaved: (value) {
// title = value!;
// },
// ),
//
// InkWell(
// borderRadius: BorderRadius.circular(20),
// onTap: () {
// setState(() {
// _getImage().whenComplete(() =>
// setState(
// () =>
// _selectedImage = _selectedImage));
// });
// },
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// border: Border.all(
// color: validImage
// ? Colors.red
//     : Colors.black),
// ),
// height: size.height * 0.15,
// width: size.width * 0.55,
// child: _selectedImage.path != ""
// ? FadeInImage(
// image: FileImage(_selectedImage),
// placeholderFit: BoxFit.fitHeight,
// placeholder: const AssetImage(
// "assets/images/icons/picture_ic.png",
// ),
// )
// : const Icon(
// Icons.add_a_photo_outlined,
// size: 35,
// ),
// ),
// ),
// const SizedBox(
// height: 5,
// ),
// TextFormField(
// keyboardType: TextInputType.name,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius:
// BorderRadius.circular(35),
// ),
// labelText: "Nomi",
// ),
// validator: (value) {
// if (value != null && value
//     .isEmpty) {
// return "To'ldirilmagan";
// }
// return null;
// },
// onSaved: (value) {
// title = value!;
// },
// ),
// Column(
// children: [
// ElevatedButton(
// onPressed: () {
// setState(() {
// if (count == 1) {
// _selectedImage.path != ""
// ? validImage = true
//     : validImage = false;
// }
// });
// addProduct();
// _create();
// // _getImage();
// },
// child: const Text("Qo'shish"),
// ),
// ],
// ),
// ],
// )),
// ),
// ),
//
// // Form(
// //   key: _keyDialogForm,
// //   child: SizedBox(
// //       height: size.height * 0.25,
// //       width: size.width * 0.7,
// //       child: Column(
// //         children: [
// //           Column(
// //             children: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     if (count == 1) {
// //                       _selectedImage.path != ""
// //                           ? validImage = true
// //                           : validImage = false;
// //                     }
// //                   });
// //                   addProduct();
// //                   _create();
// //                   // _getImage();
// //                 },
// //                 child: const Text("Qo'shish"),
// //               ),
// //             ],
// //           ),
// //         ],
// //       )),
// // ),
// ],
// )
