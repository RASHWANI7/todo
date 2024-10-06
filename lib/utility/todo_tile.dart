import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.TaskName,
    required this.TaskCompleted,
    required this.onchanged,
    required this.deletefuntion,
  });

  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deletefuntion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefuntion,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(50),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: TaskCompleted,
                onChanged: onchanged,
                activeColor: Colors.black,
              ),
              Text(
                TaskName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TaskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
