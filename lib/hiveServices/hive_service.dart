import 'package:hive/hive.dart';

import '../models/notes.dart';

class HiveService {
  static List<Notes> notePadList = [];
 // static var box = Hive.box('notepad');

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
  static storeNotes(Notes notes) async {
    final box = await Hive.openBox<Notes>('notepad');
    box.add(notes);
    // Or update existing data:
    // box.putAt(index, newData);
  }

   // static storeNotes(Notes notes) {
   //  // box.put('notesItem',notes.toJson());
   // }

   //  static loadNotes()  {
   //   Notes notes = Notes.fromJson(box.get('notesItem'));
   //   return notes;
   // }
   //
    static updateNotes(Notes notes,int index) async {
    // box.putAt(index,notes);
   }

}
