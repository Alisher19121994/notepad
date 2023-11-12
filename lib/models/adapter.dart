
import 'package:hive/hive.dart';
import 'package:notepad/models/notes.dart';


class NotesAdapter extends TypeAdapter<Notes> {
  @override
  final int typeId = 1;

  @override
  Notes read(BinaryReader reader) {
    final description = reader.readString();
    final timeOfTask = reader.readString();
    final dateOfTask = reader.readString();
    return Notes(description: description,timeOfTask: timeOfTask,dateOfTask: dateOfTask);
  }

  @override
  void write(BinaryWriter writer, Notes obj) {
    writer.writeString(obj.description??'');
    writer.writeString(obj.timeOfTask??'');
    writer.writeString(obj.dateOfTask??'');
  }
}

