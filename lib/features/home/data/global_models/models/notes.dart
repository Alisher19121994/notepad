import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Notes {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? dateOfTask;
  @HiveField(3)
  String? timeOfTask;

  Notes({this.title,this.description, this.dateOfTask, this.timeOfTask});
}
