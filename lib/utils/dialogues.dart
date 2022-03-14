import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingDialogue(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Row(
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  width: 15,
                ),
                Text("Loading..."),
              ],
            ),
          ));
}

void showSuccessDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        )
      ],
      title: const Text("Sucess"),
      content: Row(
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 20,
          ),
          Text("Todo Added Successfully"),
        ],
      ),
    ),
  );
}

void showDangerDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close"),
        )
      ],
      title: const Text("Error"),
      content: Row(
        children: const [
          Icon(Icons.error),
          SizedBox(
            width: 20,
          ),
          Text("There was an issue"),
        ],
      ),
    ),
  );
}
