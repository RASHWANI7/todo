import 'package:flutter/material.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utility/dialog_box.dart';
import 'package:todo/utility/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controllar = TextEditingController();
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.creatInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  void checkboxChanged(int index, bool? value) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void savenewtask() {
    setState(() {
      db.toDoList.add([_controllar.text, false]);
      _controllar.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void closetyping() {
    setState(() {
      _controllar.clear();
    });
    Navigator.of(context).pop();
  }

  void creatnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controllerr: _controllar,
            onsave: savenewtask,
            oncancel: closetyping,
          );
        });
  }

  void deletetask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'TODO',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          creatnewtask();
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            TaskName: db.toDoList[index][0],
            TaskCompleted: db.toDoList[index][1],
            onchanged: (value) => checkboxChanged(index, value),
            deletefuntion: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
