import 'package:alarm_clock/page/todo.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo todo;
  TodoItem({super.key, required this.todo});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    ToDo todo = widget.todo;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            onTap: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: Icon(
              todo.isDone == true ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.lime,
            ),
            tileColor: const Color.fromARGB(255, 238, 138, 131),
            title: Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                decoration: todo.isDone == false ? TextDecoration.lineThrough : null,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            trailing: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 12 ),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 18,
                  onPressed: (){},
                  color: Colors.white,
                ),
              ),
            ),
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
                ),
              ),
            ],
          )
        ),
      ],
    );
  }
}