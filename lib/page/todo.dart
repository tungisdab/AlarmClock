import 'package:alarm_clock/page/todo_item.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../page/todo_item.dart';

class Todo extends StatefulWidget {
  Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  final todosList  = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundTodo = [];
  
  @override
  void initState() {
    _foundTodo = todosList;
    super.initState();
  }

  void _handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _deleteItem(int id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(
        id: todosList.length + 1,
        todoText: toDo,
        isDone: false,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList;
    } else {
      results = todosList.where((todo) => todo.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                        left: 20
                      ),
                      child: Text(
                        'Todo List',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // padding: EdgeInsets.all(20
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20

                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 204, 238),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value){
                          _runFilter(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20,
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 20,
                            minHeight: 25,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search todo',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // child: Text(
                      //   'Todo List',
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ],
                ),
                for (ToDo i in _foundTodo.reversed) 
                  TodoItem(
                    todo: i,
                    onToDoChanged: _handleTodoChange,
                    onDeleteItem: _deleteItem,
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.lime,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0, 0.0),
                      ),]
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add Todo',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                      )
                    ),
                    onPressed: (){
                      _addToDoItem(_todoController.text); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      minimumSize: Size(50, 50),
                      elevation: 10
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}