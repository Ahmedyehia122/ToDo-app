import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:to_o_app/components/dialog_box.dart';
import 'package:to_o_app/components/task_tile.dart';
import 'package:to_o_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the box
  final _mybox = Hive.box('myBox');

  @override
  void initState() {
    // if it's 1st time ever opening the app , then create default data

    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //there already exists data

      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _Controller = TextEditingController();

  //list of to do tasks

  ToDoDataBase db = ToDoDataBase();

//checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_Controller.text, false]);
      _Controller.clear();
    });
    Navigator.of(context).pop();
  }

  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _Controller,
          onSave: saveNewTask,
          onChange: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'TO DO',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (BuildContext) => deleteTask(index),
          );
        },
      ),
    );
  }
}
