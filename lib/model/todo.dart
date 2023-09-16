class ToDo {
  int? id;
  String? todoText;
  bool? isDone;
  
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,  
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: 1, todoText: 'add Todo', isDone: true),
      
      // ToDo(id: 2, todoText: 'khanh2', isDone: true),
      // ToDo(id: 3, todoText: 'khanh3'),
      // ToDo(id: 4, todoText: 'khanh4', isDone: true),
      // ToDo(id: 5, todoText: 'khanh5'),
    ];
  }
}