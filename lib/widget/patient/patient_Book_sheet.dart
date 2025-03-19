import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceTimeDateWidget extends StatelessWidget {
  final String price;
  final String selectedTime;
  final String selectedDate;

  const PriceTimeDateWidget({
    super.key,
    required this.price,
    required this.selectedTime,
    required this.selectedDate,
  });

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Container(
      width: 250.w,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label $value"),
          Icon(icon),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInfoRow("Price:", price, Icons.attach_money_sharp),
        _buildInfoRow("Time:", selectedTime, Icons.access_time_rounded),
        _buildInfoRow("Date:", selectedDate, Icons.date_range),
      ],
    );
  }
}
