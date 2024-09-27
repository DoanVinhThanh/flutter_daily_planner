import 'package:flutter/material.dart';
import 'package:flutter_daily_planner/model/task.dart';

import 'package:flutter_daily_planner/screens/edit_task_screen.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách công việc"),
         

      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 147, 215, 250)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ReorderableListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            for (int index = 0; index < tasks.length; index += 1)
              Card(
                key: Key('$index'), // Mỗi item cần có một key duy nhất
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Bo góc
                ),
                elevation: 4, // Hiệu ứng bóng
                margin: const EdgeInsets.symmetric(vertical: 8), // Khoảng cách giữa các card
                color: Color.fromARGB(255, 140, 205, 252), // Màu nền của card (thay đổi theo ý muốn)

                child: ListTile(
                  title: Text("${tasks[index].title}"),
                  subtitle: Text(
                      '${tasks[index].date} | ${tasks[index].people} | ${tasks[index].time} | ${tasks[index].destination}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final updatedTask = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskScreen(task: tasks[index]),
                            ),
                          );
                          if (updatedTask == null) {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          } else {
                            setState(() {
                              tasks[index] = updatedTask;
                            });
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                      Icon(Icons.drag_handle_sharp),
                    ],
                  ),
                ),
              ),
          ],
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final task = tasks.removeAt(oldIndex);
              tasks.insert(newIndex, task);
            });
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      
    );
  }
}