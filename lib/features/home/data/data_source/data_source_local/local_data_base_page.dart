import 'package:hive/hive.dart';
import '../../global_models/models/notes.dart';


class HiveService {
  static storeNotes(Notes notes) async {
    final box = await Hive.openBox<Notes>('notepad');
    box.add(notes);
  }

  static updateNotes(Notes notes, int index) async {
    final box = await Hive.openBox<Notes>('notepad');
    box.putAt(index, notes);
  }
}
