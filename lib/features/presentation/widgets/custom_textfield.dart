import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Icon? icon;
  final bool? obscureText;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText,
    this.onChanged,
    this.labelText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText !=null
            ? Text(labelText??"",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color:AppColors.appBlackColor,
            fontWeight: FontWeight.bold,
          ),)
            :Container(),
        SizedBox(height: 1.h),
        TextField(
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
        )
      ],
    );
  }
}
