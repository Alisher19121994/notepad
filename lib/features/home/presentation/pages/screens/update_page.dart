import 'package:flutter/material.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import '../../admobs_google/google_admobs.dart';
import '../../../data/data_source/data_source_local/local_data_base_page.dart';
import '../../../data/global_models/models/notes.dart';

class UpdatePage extends StatefulWidget {
  final String title;
  final String descriptionOfTask;
  final String timeOfTask;
  final String dateOfTask;
  final int index;
  const UpdatePage(
      {super.key,
        required this.title,
        required this.descriptionOfTask,
        required this.timeOfTask,
        required this.dateOfTask,
        required this.index});

  static const String id = 'UpdatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateTimePickerController = TextEditingController();
  TextEditingController timePickerController = TextEditingController();

  void showSuccessfulDialog(){
    showDialog(
        context: context,
        builder: (context){
          return const AlertDialog(
            backgroundColor: Colors.greenAccent,
            title: Text("Task",style: TextStyle(color:Colors.black,fontSize: 17,fontWeight: FontWeight.normal),),
            content:  Text("Successfully updated",style: TextStyle(color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
          );
        });
  }

  @override
  void initState() {
    titleController.text= widget.title;
    descriptionController.text= widget.descriptionOfTask;
    timePickerController.text =  widget.timeOfTask;
    dateTimePickerController.text = widget.dateOfTask;
    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    timePickerController.dispose();
    dateTimePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffe7effa),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff699BE0),
        title: const Text(
          'Update Task',
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
                  const Text('Update title',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                  const Text('What is to be updated?',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                          decoration:  InputDecoration(
                            hintText: widget.descriptionOfTask,
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
                                decoration:  InputDecoration(
                                  hintText: widget.dateOfTask,
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
                                decoration: InputDecoration(
                                  hintText: widget.timeOfTask,
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
              var updateNotes = HiveService.updateNotes(
                  Notes(
                      title: titleController.text,
                      description: descriptionController.text,
                      dateOfTask:  dateTimePickerController.text,
                      timeOfTask: timePickerController.text),widget.index);
              if(updateNotes != null ){
                showSuccessfulDialog();
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
