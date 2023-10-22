import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final void Function()? onPressed;

  MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(name),
    );
  }
}
