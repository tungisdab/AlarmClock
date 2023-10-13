import 'dart:convert';
import 'package:alarm_clock/page/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/todo.dart';

class TodoView extends StatefulWidget {
  TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  final _todoController = TextEditingController();
  List<Todo>? todoList = [];
  List<Todo>? foundTodo = [];
  List<dynamic>? todoListJson = [];
  
  setupTodo() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? todoJson = prefs.getString('todos');
    if (todoJson != null) {
      todoListJson = jsonDecode(todoJson);
    }
    todoList = todoListJson!.map((e) => Todo.fromJson(e)).toList();
    // for (var i = 0; i < todoList!.length; i++) {
    //   print(todoList![i].toJson());
    // }
  } 

  addTodo(String text) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = 0;
    if(todoList == null){
      id = todoList!.length + 1;
    }
    List item = [id, text, false];
    item = todoList!.map((e) => e.toJson()).toList();
    prefs.setString('todos', jsonEncode(item));
    _todoController.clear();
  }

  @override
  void initState() {
    setupTodo();
    foundTodo = todoList;
    super.initState();
  }


  void _handleTodoChange(Todo todo){
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _deleteItem(int id){
    if(todoList !=null){
      setState(() {
        todoList!.removeWhere((item) => item.id == id);
      });
    }
  }

  void _runFilter(String enteredKeyword){
    List<Todo>? results = [];
    if(enteredKeyword.isEmpty){
      results = todoList;
    } else {
      results = todoList!.where((todo) => todo.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      foundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Column(
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
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            _runFilter(value);
                          });
                          // _runFilter(value);
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
                for (Todo i in foundTodo!.reversed) 
                  TodoItem(
                    todo: i,
                    onToDoChanged: _handleTodoChange,
                    onDeleteItem: _deleteItem,
                  ),
              ],
            ),
          ),
          Align(
            child: Container(
              child: Align(
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
                          color: Colors.grey.shade300,
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
                            hintText: 'Write a love note',
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
                            color: Colors.white
                          )
                        ),
                        onPressed: (){
                          setState(() {
                            addTodo(_todoController.text);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: Size(50, 50),
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}