import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:ndialog/ndialog.dart';
import 'package:notepad/features/home/presentation/pages/screens/sub_home_page.dart';
import 'package:notepad/features/home/presentation/pages/screens/update_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../constants/compnents.dart';
import '../../admobs_google/google_admobs.dart';
import '../../../data/data_source/data_source_local/local_data_base_page.dart';
import '../../../data/global_models/models/notes.dart';
import 'morePage/hand_writing.dart';
import 'new_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse('https://play.google.com/store/apps/details?id=com.daminov.notepad.notepad');
  TextEditingController descriptionController = TextEditingController();
  HiveService hiveService = HiveService();
  Notes notes = Notes();
  var logger = Logger();
  String text = '';
  bool isTrue = true;
  late final AudioRecorder record;
  late final AudioPlayer player;
  bool isRecording = false;
  String audioPath = '';

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

   List<DropdownMenuItem<dynamic>> itemsList = [];
  // List<Map<dynamic, dynamic>> items = [];
   //List<Map<String, dynamic>> _foundUsers = [];
 // var a =  Hive.openBox<Notes>('notepad');
 //
 //  var list  = Hive.box('notepad');

   // void _refreshItem()async{
   //  // var item;
   //
   //   final data = list.keys.map((key) {
   //     final item = list.get(key);
   //       return {'key': key, 'title':item['title']};
   //   }).toList();
   //   // items.add(item);
   //  // _runFilter('',it:item);
   //
   //   setState(() {
   //     itemsList = data.reversed.cast<DropdownMenuItem>().toList();
   //     print('itemsList: $itemsList');
   //   });
   // }


  void _runFilter(String enteredKeyword,{dynamic it}) {
    List<DropdownMenuItem<dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      //results = _allUser;
      results = it;
    } else {
      results = it.where((user) => user["title"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      //results = _allUser.where((user) => user["title"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      itemsList = results;
    });
  }


  @override
  initState() {
    record = AudioRecorder();
    player = AudioPlayer();
    // _foundUsers = _allUser;
    super.initState();
    //_refreshItem();

  }
  @override
  void dispose() {
    record.dispose();
    player.dispose();
    super.dispose();
  }
/**/
  // void showDialog() {
  //   NAlertDialog(
  //     dialogStyle: DialogStyle(titleDivider: true),
  //     content: Container(
  //       margin: const EdgeInsets.only(top: 18.0),
  //       child: TextFormField(
  //         controller: descriptionController,
  //         style: const TextStyle(color: Colors.black),
  //         decoration: const InputDecoration(
  //             hintText: 'Enter Quick Task Here:',
  //             contentPadding: EdgeInsets.all(5.0),
  //             border: OutlineInputBorder()),
  //       ),
  //     ),
  //     actions: <Widget>[
  //       InkWell(
  //         onTap: () {
  //           Navigator.pop(context);
  //         },
  //         child: Container(
  //             height: 38.0,
  //             margin: const EdgeInsets.all(8.0),
  //             padding: const EdgeInsets.all(4.0),
  //             decoration: BoxDecoration(
  //                 color: const Color(0xffff0000),
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 border: Border.all(
  //                   width: 1.4,
  //                   color: const Color(0xffff0000),
  //                 )),
  //             child: const Center(
  //                 child: Text(
  //               "Close",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold),
  //             ))),
  //       ),
  //       InkWell(
  //         onTap: () {
  //           notes = Notes(description: descriptionController.text);
  //           HiveService.storeNotes(Notes(description: notes.description));
  //           descriptionController.clear();
  //           Navigator.pop(context);
  //         },
  //         child: Container(
  //             height: 38.0,
  //             margin: const EdgeInsets.all(8.0),
  //             padding: const EdgeInsets.all(4.0),
  //             decoration: BoxDecoration(
  //                 color: const Color(0xff0abf53),
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 border: Border.all(
  //                   width: 1.4,
  //                   color: const Color(0xff0abf53),
  //                 )),
  //             child: const Center(
  //                 child: Text("Save",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold)))),
  //       ),
  //     ],
  //   ).show(context);
  // }

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
     /*****/
    // SizedBox(
    //   height: 120,
    //   child: Positioned.fill(
    //     top: 20,
    //     child: Align(
    //       alignment: Alignment.center,
    //       child:
    //       Consumer<HomeController>(builder: (context, provider, child) {
    //         return DropdownButton<String>(
    //           value: provider.currentTheme,
    //           items: [
    //             //Light, dark, and system
    //             DropdownMenuItem<String>(
    //               value: 'light',
    //               child: Text(
    //                 'Light',
    //                 style: Theme.of(context).textTheme.titleLarge,
    //               ),
    //             ),
    //             DropdownMenuItem<String>(
    //               value: 'dark',
    //               child: Text(
    //                 'Dark',
    //                 style: Theme.of(context).textTheme.titleLarge,
    //               ),
    //             ),
    //             DropdownMenuItem<String>(
    //               value: 'system',
    //               child: Text(
    //                 'System',
    //                 style: Theme.of(context).textTheme.titleLarge,
    //               ),
    //             ),
    //           ],
    //           onChanged: (String? value) {
    //             provider.changeTheme(value ?? 'system');
    //           },
    //         );
    //       }),
    //     ),
    //   ),
    // ),
  ],
)).show(context);
  }

  Future<void> startRecording()async {
    try{
      if(await record.hasPermission()){
        await record.start(const RecordConfig(), path: '');
        setState(() {
          isRecording = true;
        });
      }

    }catch(e){
      print('ERROR: startRecording in $e');
    }
  }

  Future<void> stopRecording()async {
    try{
      String? path = await record.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    }catch(e){
      print('ERROR: stopRecording in $e');
    }
  }
  Future<void> playRecording()async{
    try{
      Source urlSource = UrlSource(audioPath);
      await player.play(urlSource);

    }catch(e){
      print('ERROR: playRecording in $e');
    }
  }

  void bottomSheetsDialog(){
    showModalBottomSheet(
      builder: (BuildContext context) {
        return Container(
          height: 200,
            color: Colors.white,
              child: Column(
               children: [

                 Row(
                   children: [
                     if(isRecording)
                       Text('Recording in progress'),
                      ElevatedButton(
                         onPressed: ()=> isRecording ? stopRecording: startRecording,
                         child: isRecording ? Text('Stop Recording'):Text('Start Recording')),
                     if(!isRecording)
                     ElevatedButton(
                         onPressed: ()=> playRecording,
                         child: Text('Play Recording'))

                   ],
                 )

         ],
       )

        );
      }, context:context,

    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
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
          ],
        ),
        actions: [
          PopupMenuButton(
              offset: const Offset(0, 40),
              elevation: 29,
              iconSize: 22,
              itemBuilder: (BuildContext context) => [
                //#Handwriting
                PopupMenuItem<int>(
                  height: 50,
                  value: 3,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                     Navigator.pushNamed(context, HandWritingPage.id);
                      },
                      child: const Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            size: 24,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          // Optional spacing between icon and text
                          Text(
                            'Hand writing',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //#Voice recording
                PopupMenuItem<int>(
                  height: 50,
                  value: 3,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        bottomSheetsDialog();
                      },
                      child: const Row(
                        children: <Widget>[
                          Icon(
                            Icons.mic_none,
                            size: 24,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          // Optional spacing between icon and text
                          Text(
                            'Voice recording',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //#Language
                PopupMenuItem<int>(
                      height: 50,
                      value: 3,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            showLanguageDialog();
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.language,
                                size: 24,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              // Optional spacing between icon and text
                              Text(
                                'Language',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                //#Share with friends
                PopupMenuItem<int>(
                      height: 50,
                      value: 3,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            Share.share('https://play.google.com/store/apps/details?id=com.daminov.notepad.notepad', subject: 'Subscribe and Rate us!');
                          },
                          child: const Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 24,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              // Optional spacing between icon and text
                              Text(
                                'Share with friends',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                //#Rate the app
                PopupMenuItem<int>(
                  height: 50,
                  value: 3,
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        _launchUrl();
                      },
                      child: const Row(
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            size: 24,
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          // Optional spacing between icon and text
                          Text(
                            'Rate the app',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                  ])
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                      padding: const EdgeInsets.only(left: 4.0,right: 4.0,top: 4.0),
                      height: 42,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(1.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            hintText: 'Search notes for title...',
                            border: OutlineInputBorder()),
                        onChanged: (value) => _runFilter(value),
                      ),
                    ),
                Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: size.height * 0.70,
                            child: FutureBuilder(
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
                                        reverse: true,
                                        shrinkWrap: true,
                                       // primary: true,
                                        itemCount: box.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          final data = box.getAt(index)!;
                                          return InkWell(
                                            onTap: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                                return SubHomePage(
                                                  title: data.title??'',
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
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: size.height*0.030,
                                                        width: double.infinity,
                                                        child: Text(data.title??'',
                                                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 19.0),overflow: TextOverflow.ellipsis,),
                                                      ),
                                                      const SizedBox(height:16.0),
                                                      SizedBox(
                                                        height: size.height*0.030,
                                                        width: double.infinity,
                                                        child: Text(data.description??'',
                                                          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 16.0),overflow: TextOverflow.ellipsis,),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height:6.0),
                                                  //#share,edit,delete
                                                  Container(
                                                    height: size.height * 0.048,
                                                    width: double.infinity,
                                                    padding: const EdgeInsets.all(2.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        //  Container(
                                                        //      width: size.width * 0.22,
                                                        //      padding: const EdgeInsets.all(2.0),
                                                        //      decoration: BoxDecoration(
                                                        //          borderRadius: BorderRadius.circular(4.0),
                                                        //          border: Border.all(width: 1.4,color: Colors.red),
                                                        //          color: Colors.red
                                                        //      ),
                                                        //     child: const Text('Deadline:',style: TextStyle(color: Colors.white,fontSize: 18.5,fontWeight: FontWeight.bold),)),
                                                        // const SizedBox(width: 10.0),
                                                        SizedBox(
                                                          child: Text(data.dateOfTask??'',
                                                              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                                                  fontSize: 19.0),overflow: TextOverflow.ellipsis),

                                                        ),
                                                        const SizedBox(width:6.0),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                          children: [
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
                                                                  },
                                                                  icon: const Icon(Icons.share,color: Colors.black,size: 20,)),
                                                            ),
                                                            const SizedBox(width: 10.0),
                                                            Container(
                                                              height: size.height * 0.04,
                                                              width: size.width * 0.10,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.0),
                                                                border: Border.all(width: 1.4,color: Colors.black),
                                                                //color: Colors.white
                                                              ),
                                                              child: Center(
                                                                child: IconButton(
                                                                    onPressed: (){
                                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                                                        return UpdatePage(
                                                                          title: data.title??'',
                                                                          descriptionOfTask: data.description??'',
                                                                          timeOfTask: data.timeOfTask??'',
                                                                          dateOfTask: data.dateOfTask??'',
                                                                          index: index,);
                                                                      }));
                                                                    },
                                                                    icon: const Icon(Icons.edit,color: Colors.black,size: 20,)),
                                                              ),
                                                            ),
                                                            const SizedBox(width: 10.0),
                                                            Container(
                                                              height: size.height * 0.04,
                                                              width: size.width * 0.10,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.0),
                                                                border: Border.all(width: 1.4,color: Colors.black),
                                                                //color: Colors.white
                                                              ),
                                                              child: Center(
                                                                child: IconButton(
                                                                    onPressed: (){
                                                                      setState(() {
                                                                        box.deleteAt(index);
                                                                      });

                                                                    },
                                                                    icon: const Icon(Icons.delete,color: Colors.black,size: 20,)),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
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
                          ),
                          Container(
                            color: Colors.white,
                            height: 60.0,
                            width: double.infinity,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12.0),
                                  width: size.width * 0.70,
                                  child: TextField(
                                    controller:descriptionController,
                                    minLines: 1,
                                    maxLines: 1,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Quick Task Here:',
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //# google micro
                                    IconButton(
                                        onPressed:()async{
                                          await SpeechToTextGoogleDialog.getInstance().showGoogleDialog(onTextReceived: (data) {
                                            setState(() {
                                              descriptionController.text = data.toString();
                                            });
                                          });
                                        },
                                        icon:const Icon(Icons.mic,color: Colors.black,size: 24,)
                                    ),
                                    //#Send data
                                    IconButton(
                                        onPressed:(){
                                          if(descriptionController.text.isNotEmpty){
                                            notes = Notes(description: descriptionController.text);
                                            HiveService.storeNotes(Notes(description: notes.description));
                                            descriptionController.clear();
                                          }
                                        },
                                        icon:const Icon(Icons.send,color: Colors.black,size: 24,)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          isTrue ? const SizedBox(
                            height: 60,
                            child: CustomBannerAd(),
                          )
                              :const SizedBox(
                                     height: 60,
                                     child: Center(child: Text('Contain ads'),),
                          )
                        ],
                      ),
              ],
            ),
        ),
      floatingActionButton: Align(
          alignment: const Alignment(0.9, 0.7),
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
