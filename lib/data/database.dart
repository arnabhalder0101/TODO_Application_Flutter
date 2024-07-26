// ignore_for_file: unused_local_variable

import 'package:hive/hive.dart';

class TodoDataBase {
  List todoTasks = [];
  // referance --
  final myBox = Hive.box("myBox");

  void createInitialData() {
    //1st time ever opening the app --

    // todoTasks.add(["Programming", false]);
    // todoTasks.add(["Do exercise", false]);
    todoTasks = [
      ["Programming", false],
      ["Exercise", false]
    ];
    myBox.put("TODOLIST", todoTasks);
  }

  void loadData() {
    todoTasks = myBox.get("TODOLIST");
  }

  void updateData() {
    myBox.put("TODOLIST", todoTasks);
  }
}
