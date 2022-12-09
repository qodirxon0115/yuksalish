import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Timer showModalSheetWidget(context,listTile) {
  return Timer(
    Duration(milliseconds: 100),
    () {
      showModalBottomSheet<void>(
        isScrollControlled: true,
        useRootNavigator: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              children: <Widget>[
            Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10,bottom: 15),
                  height: 15,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black12),
                ),
              ),
                Expanded(
                  child: ListView(children: listTile,),
                )
              ],
            )


          );
        },
      );
    },
  );

  // GestureDetector(onTap: (){
  //   );
}
