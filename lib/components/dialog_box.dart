import 'package:flutter/material.dart';
import 'package:to_o_app/components/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  void Function()? onSave;
  void Function()? onChange;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add a new task'),
            ),

            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button

                MyButton(
                  name: 'Save',
                  onPressed: onSave,
                ),

                const SizedBox(
                  width: 10,
                ),
                //cancle button
                MyButton(
                  name: 'Cancle',
                  onPressed: onChange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
