import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const TodoItem({super.key, required this.todo, required this.onToDoChanged, required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title:  Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          // margin: EdgeInsets.symmetric(vertical: 10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
              onPressed: () {
                // print('Clicked on delete button');
                onDeleteItem(todo.id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
