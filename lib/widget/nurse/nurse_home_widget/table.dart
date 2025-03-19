import 'package:flutter/material.dart';

// Widget for Table Header
Widget tableHeader() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("No", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Time", style: TextStyle(fontWeight: FontWeight.bold)),
      Text("Place", style: TextStyle(fontWeight: FontWeight.bold)),
      Icon(Icons.check_box_outline_blank),
    ],
  );
}

// Widget for Table Row
Widget tableRow(int no, String name, String time, String place, bool checked) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10, height: 30, child: Text("$no")),
      SizedBox(width: 100, height: 30, child: Text(name)),
      Text(time),
      Text(place),
      Icon(checked ? Icons.check_box : Icons.check_box_outline_blank,
          color: checked
              ? const Color.fromARGB(255, 76, 124, 175)
              : Colors.grey),
    ],
  );
}
