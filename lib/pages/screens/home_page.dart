import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:ndialog/ndialog.dart';
import 'package:notepad/components/compnents.dart';
import 'package:notepad/controller/control_home.dart';
import 'package:notepad/hiveServices/hive_service.dart';
import 'package:notepad/models/notes.dart';
import 'package:notepad/pages/screens/new_task_page.dart';
import 'package:notepad/pages/screens/sub_home_page.dart';
import 'package:notepad/pages/screens/update_page.dart';
import 'package:provider/provider.dart';
//import 'package:share_plus/share_plus.dart';

import '../../googleAds/googleads_page.dart';
import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController descriptionController = TextEditingController();
  HiveService hiveService = HiveService();
  Notes notes = Notes();
  var logger = Logger();
  String text = '';

  //
  // final List<Map<String, dynamic>> _allUser = [
  //   {"id": 1, "name": "Andy", "age": 29},
  //   {"id": 2, "name": "Aragon", "age": 40},
  //   {"id": 3, "name": "Bob", "age": 5},
  //   {"id": 4, "name": "Barbara", "age": 35},
  //   {"id": 5, "name": "Candy", "age": 21},
  //   {"id": 6, "name": "Colin", "age": 55},
  //   {"id": 7, "name": "Audra", "age": 30},
  //   {"id": 8, "name": "Banana", "age": 14},
  //   {"id": 9, "name": "Caversky", "age": 100},
  //   {"id": 10, "name": "Alisher", "age": 32},
  //   {"id": 11, "name": "Abbos", "age": 32},
  //   {"id": 12, "name": "Muhammad Ali", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  //   {"id": 13, "name": "Becky", "age": 32},
  // ];

  //  List<Map<dynamic, dynamic>> itemsList = [];
  // // List<Map<dynamic, dynamic>> items = [];
  //  //List<Map<String, dynamic>> _foundUsers = [];
  //
  //  void _refreshItem()async{
  //   // var item;
  //    final data = notePadBox.keys.map((key) {
  //      final item = notePadBox.get(key);
  //        return {'key': key, 'description':item['description']};
  //    }).toList();
  //    // items.add(item);
  //   // _runFilter('',it:item);
  //
  //    setState(() {
  //      itemsList = data.reversed.toList();
  //      print('itemsList: $itemsList');
  //    });
  //  }

  //
  // void _runFilter(String enteredKeyword,{dynamic it}) {
  //   List<Map<String, dynamic>> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     //results = _allUser;
  //     results = it;
  //   } else {
  //     results = it.where((user) => user["description"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  //     //results = _allUser.where((user) => user["title"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
  //   }
  //   setState(() {
  //     //itemsList = results;
  //   });
  // }

  //
  // @override
  // initState() {
  //   // _foundUsers = _allUser;
  //   super.initState();
  //   //_refreshItem();
  //
  // }

  void showDialog() {
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      content: Container(
        margin: const EdgeInsets.only(top: 18.0),
        child: TextFormField(
          controller: descriptionController,
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
              hintText: 'Enter Quick Task Here:',
              contentPadding: EdgeInsets.all(5.0),
              border: OutlineInputBorder()),
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 38.0,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: const Color(0xffff0000),
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    width: 1.4,
                    color: const Color(0xffff0000),
                  )),
              child: const Center(
                  child: Text(
                "Close",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))),
        ),
        InkWell(
          onTap: () {
            notes = Notes(description: descriptionController.text);
            HiveService.storeNotes(Notes(description: notes.description));
            descriptionController.clear();
            Navigator.pop(context);
          },
          child: Container(
              height: 38.0,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: const Color(0xff0abf53),
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    width: 1.4,
                    color: const Color(0xff0abf53),
                  )),
              child: const Center(
                  child: Text("Save",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)))),
        ),
      ],
    ).show(context);
  }

  void showLanguageDialog() {
    var size = MediaQuery.of(context).size;
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      content: Container(
        margin: const EdgeInsets.only(top: 1.0),
        child: SizedBox(
          height: size.height * 0.05,
          child: const Center(
            child: Text('Select language',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28.0),),
          )
        ),
      ),
      actions: <Widget>[
        Column(
          children: [
            RadioListTile(
              value: 'Chinese',
              groupValue: text,
              //title: const Text('Chinese',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),
            RadioListTile(
              value: 'English',
              groupValue: text,
             // title: const Text('English',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),
            RadioListTile(
              value: 'German',
              groupValue: text,
              //title:  const Text('German',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),
            RadioListTile(
              value: 'Russian',
              groupValue: text,
             // title:  const Text('Russian',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),
            RadioListTile(
              value: 'Spanish',
              groupValue: text,
              //title:  const Text('Spanish',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),
            RadioListTile(
              value: 'Uzbek',
              groupValue: text,
             // title:  const Text('Uzbek',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
              onChanged: (val) {
                setState(() {
                  text = val.toString();
                });
              },
              activeColor: Colors.blueAccent,
              selected: false,
            ),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 38.0,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: const Color(0xffff0000),
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        width: 1.4,
                        color: const Color(0xffff0000),
                      )),
                  child: const Center(
                      child: Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
            InkWell(
              onTap: () {
                notes = Notes(description: descriptionController.text);
                HiveService.storeNotes(Notes(description: notes.description));
                descriptionController.clear();
              },
              child: Container(
                  height: 38.0,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: const Color(0xff0abf53),
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        width: 1.4,
                        color: const Color(0xff0abf53),
                      )),
                  child: const Center(
                      child: Text("Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)))),
            ),
          ],
        ),
      ],
    ).show(context);
  }

  void showSwitchModeDialog() {
    NAlertDialog(
      backgroundColor: Colors.black12,
      dialogStyle: DialogStyle(titleDivider: true),
      content: Stack(
   children: [
    // AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 500),
    //   child: Image.asset(
    //     Theme.of(context).brightness == Brightness.light
    //         ? 'assets/images/light.png'
    //         : 'assets/images/dark.png',
    //     key: Key(Theme.of(context).brightness.toString()),
    //   ),
    // ),
    SizedBox(
      height: 120,
      child: Positioned.fill(
        top: 20,
        child: Align(
          alignment: Alignment.center,
          child:
          Consumer<HomeController>(builder: (context, provider, child) {
            return DropdownButton<String>(
              value: provider.currentTheme,
              items: [
                //Light, dark, and system
                DropdownMenuItem<String>(
                  value: 'light',
                  child: Text(
                    'Light',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'dark',
                  child: Text(
                    'Dark',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                DropdownMenuItem<String>(
                  value: 'system',
                  child: Text(
                    'System',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
              onChanged: (String? value) {
                provider.changeTheme(value ?? 'system');
              },
            );
          }),
        ),
      ),
    ),
  ],
)).show(context);
  }

  void shareThisApp()async{
   // Share.share('https://play.google.com/store/apps/details?id=com.gennis.teacherapp', subject: 'Subscribe and Rate us!');
  }

  void bottomSheetsDialog(){
    BottomSheet(
      onClosing: () {  },
      builder: (BuildContext context) {
        return Card(

        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffe7effa),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff699BE0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
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
              ],
            ),
            IconButton(
                onPressed: () {
                  showDialog();
                },
                icon: const Icon(
                  Icons.quick_contacts_mail_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        // actions: [
        //   PopupMenuButton(
        //       offset: const Offset(0, 40),
        //       elevation: 2,
        //       iconSize: 22,
        //       itemBuilder: (BuildContext context) => [
        //             PopupMenuItem<int>(
        //               height: 50,
        //               value: 3,
        //               child: SizedBox(
        //                 height: 50,
        //                 width: double.infinity,
        //                 child: InkWell(
        //                   onTap: () {
        //                     showSwitchModeDialog();
        //                   },
        //                   child: const Row(
        //                     children: <Widget>[
        //                       Icon(
        //                         Icons.mode_night,
        //                         size: 17,
        //                         color: Colors.black,
        //                       ),
        //                       SizedBox(width: 5),
        //                       // Optional spacing between icon and text
        //                       Text(
        //                         'Mode',
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 17,
        //                             fontWeight: FontWeight.normal),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             PopupMenuItem<int>(
        //               height: 50,
        //               value: 3,
        //               child: SizedBox(
        //                 height: 50,
        //                 width: double.infinity,
        //                 child: InkWell(
        //                   onTap: () {
        //                     showLanguageDialog();
        //                   },
        //                   child: Row(
        //                     children: const <Widget>[
        //                       Icon(
        //                         Icons.language,
        //                         size: 17,
        //                         color: Colors.black,
        //                       ),
        //                       SizedBox(width: 5),
        //                       // Optional spacing between icon and text
        //                       Text(
        //                         'Language',
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 17,
        //                             fontWeight: FontWeight.normal),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             PopupMenuItem<int>(
        //               height: 50,
        //               value: 3,
        //               child: SizedBox(
        //                 height: 50,
        //                 width: double.infinity,
        //                 child: InkWell(
        //                   onTap: () {
        //                     shareThisApp();
        //                   },
        //                   child: const Row(
        //                     children: <Widget>[
        //                       Icon(
        //                         Icons.share,
        //                         size: 17,
        //                         color: Colors.black,
        //                       ),
        //                       SizedBox(width: 5),
        //                       // Optional spacing between icon and text
        //                       Text(
        //                         'Share this app',
        //                         style: TextStyle(
        //                             color: Colors.black,
        //                             fontSize: 17,
        //                             fontWeight: FontWeight.normal),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ])
        // ],
      ),
      body: FutureBuilder(
        future: Hive.openBox<Notes>('notepad'),
        builder: (BuildContext context, AsyncSnapshot<Box<Notes>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final box = snapshot.data;
            if (box!.isEmpty) {
              return  Center(
                  child:SizedBox(
                    height: size.height * 0.45,
                    width: size.width * 0.65,
                      child: const Column(
                        children:  [
                          Image(image: AssetImage(ImageApp.unnamed),),
                          SizedBox(height: 16.0),
                          Text('Notes have not created yet!',style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 18.0),),
                        ],
                      )
                  )
              );
            } else {
              return ListView.builder(
                reverse: false,
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = box.getAt(index)!;
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return SubHomePage(
                          description: data.description??'',
                          time: data.timeOfTask??'',
                          dates: data.dateOfTask??'',);
                      }));
                    },
                    child: Container(
                      height: size.height*0.16,
                      width: size.width*0.6,
                      padding: const EdgeInsets.only(right: 8.0,left: 8.0,top: 6.0,bottom: 6.0),
                      margin: const EdgeInsets.only(right: 4.0,left: 4.0,top: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffbdd3f1)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //#deadlines
                          Container(
                            height: size.height * 0.048,
                            width: double.infinity,
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                              children: [
                                 Container(
                                     width: size.width * 0.22,
                                     padding: const EdgeInsets.all(2.0),
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(4.0),
                                         border: Border.all(width: 1.4,color: Colors.red),
                                         color: Colors.red
                                     ),
                                    child: const Text('Deadline:',style: TextStyle(color: Colors.white,fontSize: 18.5,fontWeight: FontWeight.bold),)),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  child: Text(data.dateOfTask??'',
                                      style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                          fontSize: 17.0),overflow: TextOverflow.ellipsis),

                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  child: Text(data.timeOfTask??'', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17.0),overflow: TextOverflow.ellipsis,),
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height:6.0),
                          Expanded(
                            child: SizedBox(
                              height: size.height*0.1,
                              width: double.infinity,
                              child: Text(data.description??'',
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 16.0),overflow: TextOverflow.ellipsis,),
                            ),
                          ),
                          const SizedBox(height:6.0),
                          //#share,edit,delete
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Container(
                              //   height: size.height * 0.04,
                              //   width: size.width * 0.10,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(5.0),
                              //     border: Border.all(width: 1.4,color: Colors.black),
                              //     //color: Colors.white
                              //   ),
                              //   child: IconButton(
                              //       onPressed: (){
                              //         // Navigator.pushNamed(context, NewTaskPage.id);
                              //       },
                              //       icon: const Icon(Icons.share,color: Colors.black,size: 20,)),
                              // ),
                              // const SizedBox(width: 18.0),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(width: 1.4,color: Colors.black),
                                  //color: Colors.white
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      print( data.description);
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                        return UpdatePage(
                                          descriptionOfTask: data.description??'',
                                          timeOfTask: data.timeOfTask??'',
                                          dateOfTask: data.dateOfTask??'',
                                          index: index,);
                                      }));
                                    },
                                    icon: const Icon(Icons.edit,color: Colors.black,size: 20,)),
                              ),
                              const SizedBox(width: 18.0),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(width: 1.4,color: Colors.black),
                                  //color: Colors.white
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        box.deleteAt(index);
                                      });

                                    },
                                    icon: const Icon(Icons.delete,color: Colors.black,size: 20,)),
                              )
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar:const CustomBannerAd(),
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         // Padding(
      //         //   padding: const EdgeInsets.only(left: 1.0,right: 1.0,top: 6),
      //         //   child: SizedBox(
      //         //     height: 36,
      //         //     child: TextFormField(
      //         //       style: const TextStyle(color: Colors.black),
      //         //       decoration: const InputDecoration(
      //         //           contentPadding: EdgeInsets.all(1.0),
      //         //           prefixIcon: Icon(
      //         //             Icons.search,
      //         //             color: Colors.black,
      //         //           ),
      //         //           labelText: 'Search notepad',
      //         //           border: OutlineInputBorder()),
      //         //       onChanged: (value) => _runFilter(value),
      //         //     ),
      //         //   ),
      //         // ),
      //
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: Align(
          alignment: const Alignment(0.9, 1.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(NewTaskPage.id);
            },
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.blue,
                size: 28,
              ),
            ),
          )),
    );
  }

}
