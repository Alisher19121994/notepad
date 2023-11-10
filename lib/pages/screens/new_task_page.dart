import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});
  static const String id = 'NewTaskPage';
  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final formKey = GlobalKey<FormState>();

  void showDialog(){
    NAlertDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      content: Container(
        margin: const EdgeInsets.only(top: 18.0),
        child: const Text("New Task",style: TextStyle(fontSize: 17,fontWeight: FontWeight.normal),),
      ),
      actions: <Widget>[
        TextButton(child: const Text("Successfully Saved",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            onPressed: () => Navigator.pop(context)),
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
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            padding: const EdgeInsets.only(left: 14.0,right: 6.0,top: 20.0),
            child: Column(
              children: [
                SizedBox(
                 height: size.height*0.2,
                 child: SingleChildScrollView(
                   child: Column(
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
                               minLines: 1,
                               maxLines: 1,
                               keyboardType: TextInputType.multiline,
                               decoration: const InputDecoration(
                                 label:Text('Enter Title Here:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
                               ),
                               onChanged: (value)=>{

                               }
                           ),
                         ),
                         Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100.0),
                             border: Border.all(width: 1.4,color: Colors.black12),
                             //color: Colors.white
                           ),
                           child: IconButton(
                               onPressed:(){

                               },
                               icon:const Icon(Icons.mic,color: Colors.black,size: 24,)
                               ),
                         )
                       ],
                     ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: size.width * 0.8,
                             child: TextField(
                                 minLines: 1,
                                 maxLines: 10,
                                 keyboardType: TextInputType.multiline,
                                 decoration: const InputDecoration(
                                   label:Text('Enter Task Here:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),
                                 ),
                                 onChanged: (value)=>{

                                 }
                             ),
                           ),
                           Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100.0),
                               border: Border.all(width: 1.4,color: Colors.black12),
                               //color: Colors.white
                             ),
                             child: IconButton(
                                 onPressed:(){

                                 },
                                 icon:const Icon(Icons.mic,color: Colors.black,size: 24,)
                             ),
                           )
                         ],
                       ),

                     ],
                   ),
                 )
               ),
                const SizedBox(height: 20.0,),
                SizedBox(
                    height: size.height*0.1,
                    child: SingleChildScrollView(
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
                          ),
                               Container(
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(100.0),
                                     border: Border.all(width: 1.4,color: Colors.black12),
                                     //color: Colors.white
                                 ),
                                 child: IconButton(
                                     onPressed: (){},
                                     icon: const Icon(Icons.calendar_today)
                                 ),
                               )
                             ],
                           )

                        ],
                      ),
                    )
                ),
              //  const SizedBox(height: 10.0,),
                SizedBox(
                    height: size.height*0.1,
                    child: SingleChildScrollView(
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
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(width: 1.4,color: Colors.black12),
                                  //color: Colors.white
                                ),
                                child: IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.timer_outlined)
                                ),
                              )
                            ],
                          )

                        ],
                      ),
                    )
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: const Color(0xff0abf53),
        onPressed: () {
          showDialog();
        },
        child: const Center(
          child: Icon(Icons.check,size: 28,color: Colors.white,),
        ),
      ),

    );
  }
}
