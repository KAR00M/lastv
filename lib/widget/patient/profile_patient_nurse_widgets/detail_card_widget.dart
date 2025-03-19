import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const DetailCardWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(),
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(129, 167, 186, 201),
            offset: Offset(4, 10),
            spreadRadius: 2,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title:  $value"),
          Icon(icon),
        ],
      ),
    );
  }
}
