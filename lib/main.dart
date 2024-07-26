// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/to_do.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Hive
  // final appDocumentDirectory = await getApplicationDocumentsDirectory();
  // await Hive.initFlutter(appDocumentDirectory.path);
  //init hive --
  await Hive.initFlutter();
  // open a box --
  var box = await Hive.openBox("myBox");

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDo(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
