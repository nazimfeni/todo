

import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class AddNewTaskModal extends StatefulWidget {
  AddNewTaskModal({
    super.key,
    required this.onAddTap,
  });

  final Function(Todo) onAddTap;


  @override
  State<AddNewTaskModal> createState() => _AddNewTaskModalState();
}

class _AddNewTaskModalState extends State<AddNewTaskModal> {
  final TextEditingController todoTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add New Todo',
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
              maxLines: 4,
              controller: todoTEController,
              decoration: InputDecoration(
                  hintText: 'Enter your tod here',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
              ),
              validator: (String? value){
                if(value?.isEmpty ?? true){
                  return ' Enter s value';}
                  return null;

              },
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                      {
                        Todo todo = Todo(
                            details: todoTEController.text.trim(),
                            createdDateTime: DateTime.now(),
                            updatedDateTime: DateTime.now(),);
                        widget.onAddTap(todo);
                        Navigator.pop(context);
                      }

                  },
                  child: Text("Add"),
                ))
          ],
        ),
      ),
    );
  }
}