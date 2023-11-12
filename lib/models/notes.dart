import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Notes{
//   List<NotesList>? notesList;
//
//   Notes({this.notesList});
//
//   Notes.fromJson(Map<String, dynamic> json){
//     if(json['notesList'] != null){
//       notesList = <NotesList>[];
//       json['notesList'].forEach((v){
//         notesList!.add(NotesList.fromJson(v));
//       });
//     }
//   }
//   Map<String,dynamic> toJson(){
//     final Map<String, dynamic> data = <String,dynamic>{};
//     if(notesList != null){
//       data['notesList']=this.notesList!.map((e) => e.toJson()).toList();
//     }
//     return data;
//   }
// }
//
//
// class NotesList {
  @HiveField(0)
  String? description;
  @HiveField(1)
  String? dateOfTask;
  @HiveField(2)
  String? timeOfTask;

  Notes({ this.description, this.dateOfTask, this.timeOfTask});

  // Notes.fromJson(Map<String, dynamic> json)
  //     :
  //       description = json['description'],
  //       dateOfTask = json['date'],
  //       timeOfTask = json['dateTime'];
  //
  // Map<String, dynamic> toJson() => {
  //       'description': description,
  //       'date': dateOfTask,
  //       'dateTime': timeOfTask
  //     };
}
