import 'package:flutter/material.dart';

import '../../../../../constants/compnents.dart';
import '../../admobs_google/google_admobs.dart';

class SubHomePage extends StatefulWidget {
 final String title;
 final String description;
 final String time;
 final String dates;

  const SubHomePage(
      {super.key,
      required this.title,
      required this.description,
      required this.time,
      required this.dates});

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
      bottomNavigationBar:const CustomBannerAd(),
    );
  }

  Widget listOfNotes() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 1,
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      margin: const EdgeInsets.only(right: 2.0, left: 2.0, top: 1.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: const Color(0xffbdd3f1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 5.0,right: 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.red
            ),
            child: Row(
              children: [
                const SizedBox(
                  child: Text(
                    'Deadline:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  child: Text(
                    widget.dates??'',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
                const SizedBox(width: 8.0),
                SizedBox(
                  child: Text(
                    widget.time ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title??'',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0),
                    ),
                    const SizedBox(height: 4.0,),
                    Text(
                      widget.description??'',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
