import 'package:hive/hive.dart';

import '../models/notes.dart';

class HiveService {
   List notePadList = [];
   var box = Hive.box('notepad');

  //  void storeNotes(String texts) {
  //   notePadList.add(texts);
  // }
  //
  //  void loadNotes() {
  //   notePadList = box.get('notesItem');
  // }
  //
  //  void updateNotes() {
  //   box.put('notesItem',notePadList);
  // }
    Future<void> storeNotes(Notes notes) async {
     notePadList.add(notes.toJson());
   }

    Future<Notes> loadNotes() async {
     Notes notes = Notes.fromJson(box.get('notesItem'));
     return notes;
   }

    Future<void> updateNotes() async {
     box.put('notesItem',notePadList);
   }

}
