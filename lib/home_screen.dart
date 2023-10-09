import 'package:flutter/material.dart';
import 'package:todo/add_new_task_modal.dart';
import 'package:todo/update_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddNewTaskModal();
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Actions'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Update'),
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return UpdateTaskModal();
                                  });
                            },
                          ),
                          Divider(
                            height: 0,
                          ),
                          ListTile(
                            leading: Icon(Icons.delete_outline),
                            title: Text('Delete'),
                            onTap: () {
                              Navigator.pop(context);

                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('I have to do my Homework'),
            subtitle: Text('09-10-2023'),
            trailing: Text("Pending"),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 4,
          );
        },
      ),
    );
  }
}




