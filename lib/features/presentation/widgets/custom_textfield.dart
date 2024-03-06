import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Icon? icon;

  const CustomTextField({super.key, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        bottom: 2.h
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText ?? "",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Colors.grey),),
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          prefixIcon: icon,
        ),
      ),
    );
  }

}
