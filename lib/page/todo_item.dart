import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoItem extends StatefulWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  TodoItem({super.key, required this.todo, required this.onToDoChanged, required this.onDeleteItem});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {

  @override
  Widget build(BuildContext context) {
    ToDo todo = widget.todo;
    final onToDoChanged = widget.onToDoChanged;
    final onDeleteItem = widget.onDeleteItem;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListTile(
            onTap: (){
              onToDoChanged(todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: Icon(
              todo.isDone == true ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.red,
            ),
            tileColor: Colors.grey.shade300,
            title: Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                decoration: todo.isDone == true ? TextDecoration.lineThrough : null,
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
                  onPressed: (){
                    onDeleteItem(todo.id);
                  },
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}