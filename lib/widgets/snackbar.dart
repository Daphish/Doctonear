import 'package:flutter/material.dart';

void showSnackbar(
    int type, String title, String message, BuildContext context) {
  Color backgroundColor = Colors.lightBlue.shade100;
  IconData iconData = Icons.info;

  switch (type) {
    case 1:
      iconData = Icons.check_circle_outline;
      break;
    case 2:
      iconData = Icons.warning_amber_outlined;
      break;
    case 3:
      iconData = Icons.wifi_off; // Sin conexión
      break;
    default:
      iconData = Icons.info_outline;
  }

  final snackBar = SnackBar(
    backgroundColor: backgroundColor,
    content: Row(
      children: [
        Icon(iconData, color: Colors.blue[900]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              Text(message, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
