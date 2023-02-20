import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list.dart';

import '../../../admin_pages/admin_panel_home.dart';

Widget bodyListView(context, key) {
  TextEditingController controllerText = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerCreditPrice = TextEditingController();
  final GlobalKey keyTitleForm = GlobalKey();
  final GlobalKey keyPriceForm = GlobalKey();
  final GlobalKey keyCreditPriceForm = GlobalKey();


final viewModel = Provider.of<MainProvider>(context);
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(
        height: size.height * 0.075,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: 
              InkWell(
                onTap: (){},
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.red,
                        ],
                      ),
                    ),
                    child: Shimmer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Icon(Icons.speed,color: Colors.white,),
                          ),

                          Center(
                            child:  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "Skoringdan o'tish",
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
              )),

            const Spacer(),
          ],
        ),
      ),

      //

      // Column(
      //   children: [

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Kategoriyalar ",
                  style: TextStyle(
                      color: Colors.red.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => AdminPanelListTask(
                          false, keyOne: key,
                          // dateController: dateController,
                          // nameController: nameController,
                        ),
                      ),
                    );
                  },
                  child:  Text(
                    " Barchasini ko'rish ",
                    style: TextStyle(
                        color: Colors.red.withOpacity(0.8), fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: (){

                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      StatefulBuilder(builder: (context, setState) {
                        return ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: AlertDialog(
                                elevation: 0,
                                backgroundColor:  Colors.transparent,
                                title: Container(
                                  width: size.width * 0.9,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: SizedBox(
                                      height: size.height * 0.48,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.05,
                                            child: Form(
                                              key: keyTitleForm,
                                              child: TextFormField(
                                                controller: controllerText,
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(35),
                                                  ),
                                                  labelText: "Nomi",
                                                ),
                                                validator: (value) {
                                                  if (value != null && value.isEmpty) {
                                                    return "To'ldirilmagan";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  // title = value!;
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.15,
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(20),
                                              onTap: () {
                                                setState(() {
                                                  viewModel.getImage().whenComplete(() => setState(
                                                          () => viewModel.selectedImage =
                                                              viewModel.selectedImage));
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                height: size.height * 0.15,
                                                width: size.width * 0.55,
                                                child: viewModel.selectedImage.path != ""
                                                    ? FadeInImage(
                                                  image: FileImage(viewModel.selectedImage),
                                                  placeholderFit: BoxFit.fitHeight,
                                                  placeholder: const AssetImage(
                                                    "assets/images/icons/picture_ic.png",
                                                  ),
                                                )
                                                    : const Icon(
                                                  Icons.add_a_photo_outlined,
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          SizedBox(
                                            height: size.height * 0.05,
                                            child: Form(
                                              key: keyPriceForm,
                                              child: TextFormField(
                                                controller: controllerPrice,
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(35),
                                                  ),
                                                  labelText: "Narxi",
                                                ),
                                                validator: (value) {
                                                  if (value != null && value.isEmpty) {
                                                    return "To'ldirilmagan";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  // price = value!;
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.05,
                                            child: Form(
                                              key: keyCreditPriceForm,
                                              child: TextFormField(
                                                controller: controllerCreditPrice,
                                                keyboardType: TextInputType.name,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(35),
                                                  ),
                                                  labelText: "Kredit Narxi",
                                                ),
                                                validator: (value) {
                                                  if (value != null && value.isEmpty) {
                                                    return "To'ldirilmagan";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (value) {
                                                  // price = value!;
                                                },
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {

                                                  });
                                                  // addProduct();
                                                  viewModel.addProduct(true,controllerText.text,controllerPrice.text,controllerCreditPrice.text,"Popular list",keyTitleForm,keyPriceForm,keyCreditPriceForm,context);

                                                  // _getImage();
                                                },
                                                child: const Text("Qo'shish"),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                ),

                                // Column(
                                //   children: [
                                //     InkWell(
                                //       borderRadius: BorderRadius.circular(20),
                                //       onTap: () {
                                //         setState(() {
                                //           viewModel.getImage().whenComplete(() => setState((){viewModel.selectedImage = viewModel.selectedImage;}));
                                //         });
                                //       },
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //           borderRadius: BorderRadius.circular(20),
                                //           border: Border.all(
                                //               color: Colors.black),
                                //         ),
                                //         height: size.height * 0.15,
                                //         width: size.width * 0.55,
                                //         child: viewModel.selectedImage.path != ""
                                //             ? FadeInImage(
                                //           image: FileImage(viewModel.selectedImage),
                                //           placeholderFit: BoxFit.fitHeight,
                                //           placeholder: const AssetImage(
                                //             "assets/images/icons/picture_ic.png",
                                //           ),
                                //         )
                                //             : const Icon(
                                //           Icons.add_a_photo_outlined,
                                //           size: 35,
                                //         ),
                                //       ),
                                //     ),
                                //     const SizedBox(
                                //       height: 5,
                                //     ),
                                //     Form(
                                //       key: _keyTitleForm,
                                //       child: SizedBox(
                                //           height: size.height * 0.25,
                                //           width: size.width * 0.7,
                                //           child: Column(
                                //             children: [
                                //               TextFormField(
                                //                 controller: controllerText,
                                //                 keyboardType: TextInputType.name,
                                //                 decoration: InputDecoration(
                                //                   border: OutlineInputBorder(
                                //                     borderRadius:
                                //                     BorderRadius.circular(35),
                                //                   ),
                                //                   labelText: "Nomi",
                                //                 ),
                                //                 validator: (value) {
                                //                   if (value != null && value.isEmpty) {
                                //                     return "To'ldirilmagan";
                                //                   }
                                //                   return null;
                                //                 },
                                //                 onSaved: (value) {
                                //                   title = value!;
                                //                 },
                                //               ),
                                //               Column(
                                //                 children: [
                                //                   ElevatedButton(
                                //                     onPressed: () {
                                //
                                //                       viewModel.create("Popular list", controllerText.text, "",context);
                                //                       // _getImage();
                                //                     },
                                //                     child: const Text("Qo'shish"),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ],
                                //           )),
                                //     ),
                                //   ],
                                // )

                              ),
                            ));
                      }),
                ).whenComplete(() =>
                  viewModel.selectedImage = File("")
               );
              }, child: Row(
                children: const[
                  Icon(Icons.keyboard_arrow_down_sharp,color: Colors.red,),
                   Text("Shu yerga qo'shish", style: TextStyle(color: Colors.red,
                       fontWeight: FontWeight.bold),),
                ],
              )),
            ],
          ),
          const SizedBox(height: 5,),

          const HomeListProduct( ),
          // const ProductListFirebase(),
          // const CreateProduct(kategoriya: "Gas plita"),
        ],
      ),
    ],
  );
}
