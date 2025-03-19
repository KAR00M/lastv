import 'package:flutter/material.dart';
import 'info_card_widget.dart';


class ProfileCard extends StatelessWidget {
  final String name;
  final double rating;
  final String startTime;
  final String endTime;
  final String startDay;
  final String endDay;
  final String experience;

  const ProfileCard({
    super.key,
    required this.name,
    required this.rating,
    required this.startTime,
    required this.endTime,
    required this.startDay,
    required this.endDay,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: const Color.fromARGB(42, 17, 40, 56).withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(29, 129, 173, 207).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 15,
          )
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(63, 0, 0, 0)),
                    borderRadius: BorderRadius.circular(500)),
                child: const CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage('assets/2.jpg'),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  Text("$rating"),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text("BMS/ $name",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  InfoCard(
                      title: "Time",
                      subtitle: "From: $startTime\n  To:     $endTime"),
                  const SizedBox(width: 10),
                  InfoCard(title: "Days", subtitle: "$startDay - $endDay"),
                ],
              ),
              const SizedBox(height: 10),
              InfoCard(title: "Experience", subtitle: "$experience Years"),
            ],
          )
        ],
      ),
    );
  }
}
