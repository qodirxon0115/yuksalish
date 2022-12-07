

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  dynamic navigator;
  int pageIndex = 0;


  void counter(index){
    pageIndex = index;
    notifyListeners();
  }

   List<ElevatedButton> listButton(Widget widget,context, String title){
    return  [
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),


    ];
     notifyListeners();
  }

}