import 'package:flutter/material.dart';

class PhoneField extends StatefulWidget {
  final String phone;
  final Function(String) onChanged;

  const PhoneField({
    super.key,
    required this.phone,
    required this.onChanged,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller, 
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        fillColor: Color.fromARGB(41, 17, 112, 141),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        labelText: "Phone",
      ),
      validator: (value) => (value == null || value.length < 10) ? "Enter valid phone number" : null,
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
