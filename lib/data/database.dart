import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  final _mybox = Hive.box('mybox');

  List toDoList = [];

  void creatInitialData() {
    toDoList = [
      ['MAKE TUTOTIAL', false],
      ['Keep Going', false]
    ];
  }

  void loaddata() {
    toDoList = _mybox.get('TODOLIST');
  }

  void updateDataBase() {
    _mybox.put('TODOLIST', toDoList);
  }
}
