class Task{
  int? id;
  String title;
  int isCompleted;

  Task({this.id, required this.title, this.isCompleted = 0});

  Map<String, dynamic> toMap(){
    return {'id' : id, 'title' : title, 'isCompleted' : isCompleted};
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      title: map['title'],
      id: map['id'],
      isCompleted: map['isCompleted']);
  }
}