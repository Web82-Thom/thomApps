import 'package:flutter/material.dart';
import 'package:thomapps/ressources/constants/styles.dart';

class DialogCancelButton extends StatelessWidget {
  const DialogCancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Annuler",
        style: whiteBoldText,
      ),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(Colors.red)),
    );
  }
}