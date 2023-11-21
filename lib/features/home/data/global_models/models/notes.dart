import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Notes {
  @HiveField(0)
  String? description;
  @HiveField(1)
  String? dateOfTask;
  @HiveField(2)
  String? timeOfTask;

  Notes({this.description, this.dateOfTask, this.timeOfTask});
}
