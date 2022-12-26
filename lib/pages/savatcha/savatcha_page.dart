import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/pages/home/widgets/home/custom_appBar.dart';

import '../../model/provider/model_pv.dart';

class SavatchaPage extends StatefulWidget {
  const SavatchaPage({Key? key}) : super(key: key);

  @override
  State<SavatchaPage> createState() => _SavatchaPageState();
}

class _SavatchaPageState extends State<SavatchaPage> {
  bool seeAll = false;
  final GlobalKey<ScaffoldState> keyOne = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<String> stringList = ["Kreditga olish", "Sotib Olish"];
    final viewModel = Provider.of<MainProvider>(context);
    bool showIcon = false;
    return CustomScrollView(
      slivers: [
        appBar(context, keyOne, seeAll,showIcon),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 55,
              margin: const EdgeInsets.only(top: 8.0, left: 70, right: 70),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      2,
                      (index) => InkWell(
                            onTap: () {
                              viewModel.isSelectedIndex(index);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SelectContainerIndicator(
                                  viewModel.pageIndexCount == index
                                      ? true
                                      : false,
                                  child: stringList[index],
                                ),
                              ],
                            ),
                          ))
                ],
              ),
            ),
          ]),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
              ),
              Image.asset(
                "assets/images/empty_icon.png",
                scale: 7,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Savatcha bo'sh",
                style: TextStyle(
                    color: Colors.indigo.withOpacity(0.5),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ])),
        //
      ],
    );
  }
}

class SelectContainerIndicator extends StatelessWidget {
  final bool isActive;
  final String? child;

  const SelectContainerIndicator(
    this.isActive, {
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 450),
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: isActive ? 150 : 100,
        height: isActive ? 45 : 35,
        curve: Curves.linearToEaseOut,
        decoration: BoxDecoration(
          color: isActive ? Colors.indigo.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
            child: Text(
          child ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
