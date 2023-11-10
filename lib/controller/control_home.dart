import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier{
  late String title;
  late String description;
  late String date;
  late String dateTime;

  // Future apiPostList()async {
  //   var response = await Services.GET(Services.API_LIST, Services.paramsEmpty());
  //
  //   if(response != null){
  //     items = Services.parsePostList(response);
  //   }else{
  //     items = [];
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

}