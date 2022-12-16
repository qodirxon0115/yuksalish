import 'package:flutter/material.dart';

Widget taskListDoDataItem(allList,snapshot){
  double _childAspectRatio;
  !allList?
  _childAspectRatio = 1.4 : _childAspectRatio = 0.71;
  return GridView.builder(
    scrollDirection:
    !allList ? Axis.horizontal : Axis.vertical,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: _childAspectRatio,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    ),
    itemCount: snapshot.data?.length,
    padding: const EdgeInsets.only(bottom: 10,left: 20),
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all( 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(
                    0, 5), // changes x,y position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    Expanded(
                        child: Text(
                          snapshot.data?[index].title ??
                              "",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),


                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/image_1.png"),
                    ),
                    color: Color(0xffCFECEC),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffF0F8FF)
                            .withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0,
                            5), // changes x,y position of shadow
                      ),
                    ],
                  ),

                  // child: Image.asset(
                  //   "assets/images/image_1.png",
                  // ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                            child: Text(
                                snapshot.data?[index].price ??
                                    "")),
                        Container(
                            child: Text(snapshot
                                .data?[index].description ??
                                "")),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                            child: Text(snapshot
                                .data?[index].category ??
                                "")),
                        Container(
                            child: Text(snapshot.data?[index]
                                .characteristic ??
                                "")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
    // itemCount: snapshot.data?.length ?? 0,
  );
}