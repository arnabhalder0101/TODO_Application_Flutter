import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class ToDo extends StatefulWidget {
  ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final myBox = Hive.box('myBox');
  TextEditingController txtCtrl = TextEditingController();
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (myBox.get("TODOLIST") == null) {
      // 1st time opening the app --
      db.createInitialData();
    } else {
      // already exist the data --
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanger(bool? value, int index) {
    setState(() {
      db.todoTasks[index][1] = !db.todoTasks[index][1];
      db.updateData();
    });
  }

  void onSave() {
    setState(() {
      db.todoTasks.add([txtCtrl.text, false]);
      txtCtrl.clear();
      db.updateData();
    });
    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void createNewTask() {
    setState(() {
      // show a dialoge box and take input from user --
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: txtCtrl,
              onSave: onSave,
              onCancel: onCancel,
            );
          });
      db.updateData();
    });
  }

  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow[200],
        title: Text("Delete Alert!"),
        titleTextStyle: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        content: Text('Want to delete?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                db.todoTasks.removeAt(index);
                Navigator.pop(context);
                db.updateData();
              });
            },
            child: Text("Delete"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("To Do",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow[400],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            // Sizebox --
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: db.todoTasks.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    taskname: db.todoTasks[index][0],
                    taskCompleted: db.todoTasks[index][1],
                    onChanged: (value) => checkBoxChanger(value, index),
                    deleteFunc: (context) => deleteTask(index),
                  );
                },
              ),

              // TodoTile(
              //   taskname: "Programming",
              //   taskCompleted: true,
              //   onChanged: (value) {},
              // ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_task_rounded),
        backgroundColor: Colors.yellow[400],
        elevation: 10,
      ),
    );
  }
}
