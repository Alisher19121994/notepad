class Notes{
  String? id;
  String? title;
  String? description;
  String? date;
  String? dateTime;

  Notes({this.id,this.title,this.description,this.date,this.dateTime});

  Notes.fromJson(Map<String, dynamic> json)
    :id= json['id'],
        title = json['title'],
        description = json['description'],
        date = json['date'],
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() =>{
    'id':id,
    'title':title,
    'description':description,
    'date':date,
    'dateTime':dateTime
  };


}