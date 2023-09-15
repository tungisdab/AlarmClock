import 'package:alarm_clock/page/todo_item.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../page/todo_item.dart';

class Todo extends StatefulWidget {
  Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  final todosList  = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
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
          for (ToDo i in todosList) 
            TodoItem(todo: i,),
          
        ],
      ),
    );
  }
}