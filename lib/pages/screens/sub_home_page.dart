import 'package:app_popup_menu/app_popup_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/compnents.dart';

class SubHomePage extends StatefulWidget {
  const SubHomePage({super.key});

  static const String id = 'SubHomePage';

  @override
  State<SubHomePage> createState() => _SubHomePageState();
}

class _SubHomePageState extends State<SubHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffe7effa),
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xff699BE0),
            title: Row(children: [
              SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.1,
                  child: const Image(
                    image: AssetImage(ImageApp.todo),
                  )),
              const SizedBox(width: 12.0),
              const Text(
                'NotePad',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )
            ])),

    body: listOfNotes(),
    );
  }
  Widget listOfNotes(){
    var size = MediaQuery.of(context).size;
    return Container(
        //height: size.height*0.18,
        width: size.width* 1,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(right: 4.0,left: 4.0,top: 2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xffbdd3f1)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  //color: const Color(0xffbdd3f1)
                color: Colors.black12
              ),
              child: Row(
                children: const [
                  SizedBox(
                    child: Text('7:00',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17.0),),
                  ),
                  SizedBox(width: 8.0),
                  SizedBox(
                    child: Text('23/11/2023',
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17.0),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            const Expanded(
              child: SizedBox(
               // height: size.height,
                width: double.infinity,
                child: Text('Birinchi loyhaga tayyorgashdhsjhdshdjsdjhdhdhhdhhdjshjdhsdshjdhjshjdhsjhdjhsjhdjshjdjshdjshjdh shdjshdjhsjdhjshdjshjdhsjdhjshdjshjdhjshdjshjdsjdjshdjsdjndjsnjdnsjndjsnjdnsjdnsrlik korishim kerak',
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19.0),),
              ),
            ),

          ],
        ),

      );
  }
}
