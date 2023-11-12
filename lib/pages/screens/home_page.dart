import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:ndialog/ndialog.dart';
import 'package:notepad/components/compnents.dart';
import 'package:notepad/hiveServices/hive_service.dart';
import 'package:notepad/models/notes.dart';
import 'package:notepad/pages/screens/new_task_page.dart';
import 'package:notepad/pages/screens/sub_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HiveService hiveService = HiveService();
  TextEditingController descriptionController = TextEditingController();
  Notes notes = Notes();
  var logger = Logger();

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
  //     itemsList = results;
  //   });
  // }
  //
  // Future <void>_createItem(Map<dynamic, dynamic> map) async {
  //   await notePadBox.add(map);
  //   _refreshItem();
  //   print('shoppingBox length: ${notePadBox.length}');
  // }

  @override
  initState() {
    // _foundUsers = _allUser;
    super.initState();
    //_refreshItem();

  }

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
        actions: [
          PopupMenuButton(
              offset: const Offset(0, 40),
              elevation: 2,
              iconSize: 22,
              itemBuilder: (BuildContext context) => [
                    PopupMenuItem<int>(
                      height: 50,
                      value: 3,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const NewTaskPage()));
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.mode_night,
                                size: 17,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              // Optional spacing between icon and text
                              Text(
                                'Mode',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      height: 50,
                      value: 3,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const NewTaskPage()));
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.language,
                                size: 17,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              // Optional spacing between icon and text
                              Text(
                                'Language',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PopupMenuItem<int>(
                      height: 50,
                      value: 3,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const NewTaskPage()));
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.share,
                                size: 17,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              // Optional spacing between icon and text
                              Text(
                                'Share this app',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ])
        ],
      ),
      body: FutureBuilder(
        future: Hive.openBox<Notes>('notepad'),
        builder:
            (BuildContext context, AsyncSnapshot<Box<Notes>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final box = snapshot.data;
            if (box!.isEmpty) {
              return  Center(
                  child:SizedBox(
                    height: size.height * 0.45,
                    width: size.width * 0.65,
                      child: Column(
                        children:  const [
                          Image(image: AssetImage(ImageApp.unnamed),),
                          SizedBox(height: 16.0),
                          Text('Notes have not created yet!',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.0),),
                        ],
                      )
                  )
              );
            } else {
              return ListView.builder(
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = box.getAt(index)!;
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
                              child: Text(data.description??'',
                                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19.0),),
                            ),
                          ),
                          const SizedBox(height:22.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: Text(data.timeOfTask??'',
                                      style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 17.0),overflow: TextOverflow.ellipsis,),
                                  ),
                                  const SizedBox(width: 8.0),
                                  SizedBox(
                                    child:  Text(data.dateOfTask??'',
                                        style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 17.0),overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      border: Border.all(width: 1.4,color: Colors.black),
                                      //color: Colors.white
                                    ),
                                    child: IconButton(
                                        onPressed: (){
                                       //   Navigator.pushNamed(context, NewTaskPage.id);
                                        },
                                        icon: const Icon(Icons.edit,color: Colors.black,size: 24,)),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      border: Border.all(width: 1.4,color: Colors.black),
                                      //color: Colors.white
                                    ),
                                    child: IconButton(
                                        onPressed: (){
                                         // HiveService.box.delete(index);
                                        },
                                        icon: const Icon(Icons.delete,color: Colors.black,size: 24,)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                  // return ListTile(
                  //   title: Text(data.description ?? ''),
                  //   subtitle: Text(data.timeOfTask ?? ''),
                  // );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
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
              Navigator.pushNamed(context, NewTaskPage.id);
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
