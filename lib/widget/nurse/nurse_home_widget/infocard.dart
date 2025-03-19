import 'package:flutter/material.dart';

// Widget for Info Card
Widget infoCard(String title, String subtitle) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[100],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle, style: const TextStyle(fontSize: 14)),
      ],
    ),
  );
}
