

import 'package:flutter/material.dart';

class UpdateTaskModal extends StatelessWidget {
  const UpdateTaskModal({
    super.key,
  });

  @override
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
                onPressed: () {},
                child: Text("Update"),
              ))
        ],
      ),
    );
  }
}