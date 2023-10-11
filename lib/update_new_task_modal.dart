

import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class UpdateTaskModal extends StatefulWidget {
  const UpdateTaskModal({
    super.key,
    required this.todo,
      required this.onTodoUpdate
  });
final Todo todo;
final Function(String) onTodoUpdate;
  @override
  State<UpdateTaskModal> createState() => _UpdateTaskModalState();
}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
late TextEditingController todoTEController;

  @override
  void initState(){
    super.initState();
    todoTEController = TextEditingController(text: widget.todo.details);
  }



  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'UpdateTodo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: todoTEController,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: 'Enter your tod here',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.onTodoUpdate(todoTEController.text.trim());
                  Navigator.pop(context);
                },
                child: Text("Update"),
              ))
        ],
      ),
    );
  }
}