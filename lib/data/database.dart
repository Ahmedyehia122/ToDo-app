import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //reference the box
  final _mybox = Hive.box('myBox');

  //run this method if it's 1st time ever opening the app
  void createInitialData() {
    toDoList = [
      ['Studing', false],
      ['playing football', false],
    ];
  }

  //load the data feom database
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

//update the database
  void updateDataBase() {
    _mybox.put('TODOLIST', toDoList);
  }
}
