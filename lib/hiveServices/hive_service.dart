import 'package:hive/hive.dart';

import '../models/notes.dart';

class HiveService {
  static var box = Hive.box('notepad');

  static Future<void> storeNotes(Notes notes) async {
    box.put('notes', notes.toJson());
  }

  static Future<Notes> loadNotes() async {
    Notes notes = Notes.fromJson(box.get('notes'));
    return notes;
  }

  static Future<void> deleteNotes() async {
    box.delete('notes');
  }
}
