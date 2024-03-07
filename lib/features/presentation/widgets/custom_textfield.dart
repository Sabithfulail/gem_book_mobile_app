import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Icon? icon;
  final bool? obscureText;

  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText ?? "",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        fillColor: Colors.white.withOpacity(0.1),
        filled: true,
        prefixIcon: icon,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
