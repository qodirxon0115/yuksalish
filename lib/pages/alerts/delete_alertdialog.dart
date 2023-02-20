import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/firebase_services/model_services.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
class DeleteAlertDialog extends StatelessWidget {
  final CategoryList category;
  String collection;
   DeleteAlertDialog({Key? key, required this.category,required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final viewModel = Provider.of<MainProvider>(context);
    return AlertDialog(
      title: const Text("Rostan o'chirmoqchimisiz?"),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            Text('${category.title!.title } '),
            SizedBox(height: 12,),
            const Text('Nomli mahsulot tasdiqlashingizni kutyapti'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Tasdiqlsh'),
          onPressed: () {
           viewModel.delete(category, collection, context);
           Navigator.of(context).pop();

          },
        ),
        TextButton(
          child: const Text('Bekor qilish'),
          onPressed: () {
            viewModel.fetcMovies(collection);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 800),
                backgroundColor: Colors.indigo.shade200,
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("${category.title!.title} o'chirishni bekor qildingiz"),
                  ],
                )));
            Navigator.of(context).pop();
          },
        ),
      ],
    );;
  }
}
