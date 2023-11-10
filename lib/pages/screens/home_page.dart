import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:notepad/components/compnents.dart';
import 'package:notepad/pages/screens/new_task_page.dart';
import 'package:notepad/pages/screens/sub_home_page.dart';

import '../../widgets/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _allUser = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Alisher", "age": 32},
    {"id": 11, "name": "Abbos", "age": 32},
    {"id": 12, "name": "Muhammad Ali", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
    {"id": 13, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    _foundUsers = _allUser;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUser;
    } else {
      results = _allUser
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }


  void showDialog(){
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      content: Container(
        margin: const EdgeInsets.only(top: 18.0),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(5.0),
              labelText: 'Enter Quick Task Here:',
              border: OutlineInputBorder()),
          onChanged: (value) => {

          }
        ),
      ),
      actions: <Widget>[
        TextButton(child: const Text("Close"), onPressed: () => Navigator.pop(context)),
        TextButton(child: const Text("Save"), onPressed: () => Navigator.pop(context)),
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
            IconButton(onPressed: (){
              showDialog();
            }, icon: const Icon(Icons.quick_contacts_mail_outlined,color: Colors.white,))
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
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0,right: 4.0),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.0,right: 1.0,top: 6),
                child: SizedBox(
                  height: 36,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(1.0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        labelText: 'Search notepad',
                        border: OutlineInputBorder()),
                    onChanged: (value) => _runFilter(value),
                  ),
                ),
              ),
              _foundUsers.isNotEmpty
                  ? Container(
                    margin: const EdgeInsets.only(bottom: 80.0),
                    child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) {
                      return listOfNotes(context,index);
                      // return SizedBox(
                      //   height: 90,
                      //   child: Card(
                      //     key: ValueKey(_foundUsers[index]["id"]),
                      //     color: Colors.blue,
                      //     elevation: 4,
                      //     margin: const EdgeInsets.symmetric(vertical: 10),
                      //     child: ListTile(
                      //       leading: Text(
                      //         _foundUsers[index]["id"].toString(),
                      //         style: const TextStyle(
                      //             fontSize: 24, color: Colors.white),
                      //       ),
                      //       title: Text(_foundUsers[index]['name'],
                      //           style: TextStyle(color: Colors.white)),
                      //       subtitle: Text(
                      //           '${_foundUsers[index]["age"].toString()} years old',
                      //           style: TextStyle(color: Colors.white)),
                      //     ),
                      //   ),
                      // );
                    }
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
          alignment: const Alignment(0.9, 1.0),
          child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context, NewTaskPage.id);
              },
              child: const Center(
                child: Icon(Icons.add,color: Colors.blue,size: 28,),
              ),
          )),

    );
  }
}
