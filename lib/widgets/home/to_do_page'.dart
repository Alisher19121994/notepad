
import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/screens/sub_home_page.dart';

class HomeDetails extends StatefulWidget {
  final String description;
  final String dateOfTask;
  final String timeOfTask;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

    HomeDetails({
    super.key,
    required this.description,
    required this.dateOfTask,
    required this.timeOfTask,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SubHomePage.id);
      },
      child: Container(
        height: size.height*0.18,
        width: size.width*0.6,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(right: 4.0,left: 4.0,top: 6.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xffbdd3f1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: size.height,
                width: double.infinity,
                child: Text(widget.description,
                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19.0),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Text(widget.dateOfTask,
                        style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 17.0),),
                    ),
                    const SizedBox(width: 8.0),
                    SizedBox(
                      child: Text(widget.timeOfTask,
                        style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 17.0),),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(width: 1.4,color: Colors.black),
                    //color: Colors.white
                  ),
                  child: IconButton(
                      onPressed: (){

                      },
                      icon: const Icon(Icons.edit,color: Colors.black,size: 24,)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(width: 1.4,color: Colors.black),
                    //color: Colors.white
                  ),
                  child: IconButton(
                      onPressed: (){
                        widget.deleteFunction;
                      },
                      icon: const Icon(Icons.delete,color: Colors.black,size: 24,)),
                )
              ],
            ),

          ],
        ),

      ),
    );
  }
}



