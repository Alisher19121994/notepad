
class Notes {
  String? description;
  String? dateOfTask;
  String? timeOfTask;

  Notes({ this.description, this.dateOfTask, this.timeOfTask});

  Notes.fromJson(Map<String, dynamic> json)
      :
        description = json['description'],
        dateOfTask = json['date'],
        timeOfTask = json['dateTime'];

  Map<String, dynamic> toJson() => {
        'description': description,
        'date': dateOfTask,
        'dateTime': timeOfTask
      };
}
