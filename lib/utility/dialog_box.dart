import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/utility/my_button.dart';

class DialogBox extends StatelessWidget {
  final controllerr;
  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox({
    super.key,
    required this.controllerr,
    required this.onsave,
    required this.oncancel,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 130,
        child: Column(
          children: [
            TextField(
              controller: controllerr,
              decoration: InputDecoration(
                hintText: 'add a new task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(text: 'SAVE', onpressed: onsave),
                  const SizedBox(
                    width: 15,
                  ),
                  MyButton(text: 'CANCEL', onpressed: oncancel),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
