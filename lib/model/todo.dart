class Todo {
  int? id;
  String? todoText;
  bool? isDone;
  
  Todo({
    this.id,
    this.todoText,
    this.isDone = false,  
  });


  static Todo fromJson(jsonData){
    return Todo(
      id: jsonData['id'],
      todoText: jsonData['todoText'],
      isDone: jsonData['isDone'],
    );
  }

  toJson(){
    return {
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
    };
  }

  // static List<Todo> todoList() {
  //   return [
  //     Todo(id: 1, todoText: 'add Todo', isDone: true),
  //     // ToDo(id: 2, todoText: 'khanh2', isDone: true),
  //     // ToDo(id: 3, todoText: 'khanh3'),
  //     // ToDo(id: 4, todoText: 'khanh4', isDone: true),
  //     // ToDo(id: 5, todoText: 'khanh5'),
  //   ];
  // }
}