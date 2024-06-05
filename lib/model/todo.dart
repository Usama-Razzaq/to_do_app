class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone= false});

  static List<ToDo> todoLIst(){
    return [
      ToDo(id: '01', todoText: 'Fajar Prayer', isDone: true),
      ToDo(id: '02', todoText: 'Quran Recitation', isDone: true),
      ToDo(id: '03', todoText: 'Exercise'),
      ToDo(id: '04', todoText: 'Check Emails'),
      ToDo(id: '05', todoText: 'Work on Project'),
      ToDo(id: '06', todoText: 'Learn State Managment'),
    ];

  }
}