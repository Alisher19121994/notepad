import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import '../../admobs_google/google_admobs.dart';
import '../../../data/data_source/data_source_local/local_data_base_page.dart';
import '../../../data/global_models/models/notes.dart';


class NewTaskPage extends StatefulWidget {
 const NewTaskPage({super.key,});
  static const String id = 'NewTaskPage';
  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateTimePickerController = TextEditingController();
  TextEditingController timePickerController = TextEditingController();
 // String? result;
  // late String dateTimePickerController;
  // late String timePickerController;
  HiveService hiveService = HiveService();
  Notes notes = Notes();
  var logger = Logger();


  void showSuccessfulDialog(){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('New Task Saved'),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      // margin: EdgeInsets.only(
      //   bottom: MediaQuery.of(context).size.height - 10,
      //   left: 16,
      //   right: 16,
      // ),
    ));
    // showDialog(
    //     context: context,
    //     builder: (context){
    //       return const AlertDialog(
    //         backgroundColor: Colors.greenAccent,
    //         title: Text("New Task",style: TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.normal),),
    //         content:  Text("Successfully Saved",style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
    //       );
    //     });
  }

  // void _refreshItem()async{
  //   // var item;
  //   final data = notePadBox.keys.map((key) {
  //     final item = notePadBox.get(key);
  //     return {'key': key, 'description':item['description'],'date':item['date'],
  //       'timeOfDay':item['timeOfDay'],};
  //   }).toList();
  //   // items.add(item);
  //   // _runFilter('',it:item);
  //
  //   setState(() {
  //     itemsList = data.reversed.toList();
  //     print('itemsList: $itemsList');
  //   });
  // }
  //
  // Future <void>_createItem(Map<dynamic, dynamic> map) async {
  //   await notePadBox.add(map);
  //   _refreshItem();
  //   print('notePadBox length: ${notePadBox.length}');
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffe7effa),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff699BE0),
        title: const Text(
          'New Task',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
            height: size.height,
            padding: const EdgeInsets.only(left: 14.0,right: 6.0,top: 20.0),
            child: Column(
              children: [
                //#enter title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('What is title?',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.8,
                          child: TextField(
                            controller:titleController,
                            minLines: 1,
                            maxLines: 1,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'Enter Title Here:',
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(width: 1.4,color: Colors.black12),
                          ),
                          child: IconButton(
                              onPressed:()async{
                                await SpeechToTextGoogleDialog.getInstance().showGoogleDialog(onTextReceived: (data) {
                                  setState(() {
                                    titleController.text = data.toString();
                                  });
                                });
                              },
                              icon:const Icon(Icons.mic,color: Colors.black,size: 24,)
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0,),
                //#enter to be done
                Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text('What is to be done?',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: size.width * 0.8,
                             child: TextField(
                               controller:descriptionController,
                                 minLines: 1,
                                 maxLines: 10,
                                 keyboardType: TextInputType.multiline,
                                 decoration: const InputDecoration(
                                   hintText: 'Enter Task Here:',
                                 ),
                             ),
                           ),
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100.0),
                               border: Border.all(width: 1.4,color: Colors.black12),
                             ),
                             child: IconButton(
                                 onPressed:()async{
                                   await SpeechToTextGoogleDialog.getInstance().showGoogleDialog(onTextReceived: (data) {
                                     setState(() {
                                       descriptionController.text = data.toString();
                                     });
                                   });


                                   // if (!isServiceAvailable) {
                                   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                   //     content: const Text('Service is not available'),
                                   //     backgroundColor: Colors.red,
                                   //     behavior: SnackBarBehavior.floating,
                                   //     margin: EdgeInsets.only(
                                   //       bottom: MediaQuery.of(context).size.height - 100,
                                   //       left: 16,
                                   //       right: 16,
                                   //     ),
                                   //   ));
                                   // }

                                 },
                                 icon:const Icon(Icons.mic,color: Colors.black,size: 24,)
                             ),
                           )
                         ],
                       ),
                     ],
                   ),
                const SizedBox(height: 27.0,),
                //#Due date
                SizedBox(
                    height: size.height*0.12,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           const Text('Due date',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                           const SizedBox(height: 8.0),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Container(
                                height: 40,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(width: 1.4,color: Colors.black12),
                                    color: Colors.white
                                ),
                                 child:TextField(
                                   controller: dateTimePickerController,
                                   minLines: 1,
                                   maxLines: 1,
                                   keyboardType: TextInputType.multiline,
                                   decoration: const InputDecoration(
                                     hintText: 'Date',
                                   ),
                                 ),
                          ),
                               Container(
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(100.0),
                                     border: Border.all(width: 1.4,color: Colors.black12),
                                     //color: Colors.white
                                 ),
                                 child: IconButton(
                                     onPressed: ()async{
                                       DateTime? dateTime =  await showDatePicker(
                                           context: context,
                                           initialDate: DateTime.now(),
                                           firstDate: DateTime(2020),
                                           lastDate: DateTime(2042)
                                       );
                                       if(dateTime != null){
                                         setState(() {
                                           dateTimePickerController.text = dateTime.toString().split(' ')[0];
                                         });
                                       }
                                     },
                                     icon: const Icon(Icons.calendar_today)
                                 ),
                               )
                             ],
                           )

                        ],
                      ),
                ),
                //#Due time
                SizedBox(
                    height: size.height*0.12,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Due time',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 8.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(width: 1.4,color: Colors.black12),
                                    color: Colors.white
                                ),
                                child:TextField(
                                  controller: timePickerController,
                                  minLines: 1,
                                  maxLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    hintText: 'Time',
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(width: 1.4,color: Colors.black12),
                                ),
                                child: IconButton(
                                    onPressed: ()async{
                                      TimeOfDay? timeOfDay =  await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now()
                                      );
                                      if(timeOfDay != null){
                                        setState(() {
                                          timePickerController.text = timeOfDay.toString().split(' ')[0];
                                        });
                                      }
                                    },
                                    icon: const Icon(Icons.timer_outlined)
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
        ),
      floatingActionButton: Align(
          alignment: const Alignment(1.0, 0.9),
          child: FloatingActionButton(
            backgroundColor:  const Color(0xff0abf53),
            onPressed: (){
              if(titleController.text.isNotEmpty || descriptionController.text.isNotEmpty){
              var storeNotes = HiveService.storeNotes(
                  Notes(title:titleController.text,
                  description: descriptionController.text,
                  dateOfTask: dateTimePickerController.text,
                  timeOfTask:timePickerController.text));
              if(storeNotes != null ){
                showSuccessfulDialog();
              }
              }
            },
            child: const Center(
              child: Icon(Icons.check,color: Colors.white,size: 28,),
            ),
          )),
      bottomNavigationBar:const CustomBannerAd(),
    );
  }



}
