import 'package:flutter/material.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({required this.title, required this.message, Key? key})
      : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: Navigator.of(context).pop,
          child: const Text(
            'Ok',
          ),
        ),
      ],
    );
  }
}
