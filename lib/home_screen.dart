import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/add_new_task_modal.dart';
import 'package:todo/todo.dart';
import 'package:todo/update_new_task_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      List<Todo> todoList = [];
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
                return AddNewTaskModal(
                  onAddTap: (Todo task){
                      addTodo(task);
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final Todo todo =todoList[index];
          final String formattedDate = DateFormat('hh:mm a dd-MM-yyyy').format(todo.createdDateTime);
          return ListTile(
            tileColor: todo.status == 'done'? Colors.grey: null,
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
                                    return UpdateTaskModal(
                                      todo: todo,
                                    onTodoUpdate: (String updatedDetailsText){
                                        upDateTodo(index, updatedDetailsText);

                                    },);
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
                              deleteTodo(index);
                              Navigator.pop(context);

                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            onLongPress: (){
              String currentStatus = todo.status== 'pending'?'done': 'pending';
              upDateTodoStatus(index, currentStatus);
            },
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(todo.details),
            subtitle: Text(formattedDate),
            trailing: Text(todo.status.toUpperCase()),
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
  void addTodo(Todo task){
    todoList.add(task);
    setState(() {

    });

  }

  void deleteTodo(int index){
    todoList.removeAt(index);
    setState(() {

    });
  }
  void upDateTodo(int index, String todoDetails){
    todoList[index].details = todoDetails;
    setState(() {

    });
  }

      void upDateTodoStatus(int index, String status){
        todoList[index].status = status;
        setState(() {

        });
      }
}




