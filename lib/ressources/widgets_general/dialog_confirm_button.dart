import 'package:flutter/material.dart';
import 'package:thomapps/ressources/constants/styles.dart';

class DialogConfirmButton extends StatelessWidget {
  DialogConfirmButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "Valider",
        style: blackText,
      ),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(Colors.green)),
    );
  }
}