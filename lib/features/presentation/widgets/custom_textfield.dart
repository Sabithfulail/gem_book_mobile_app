import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Icon? icon;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final Color? fillColor;
  final bool isConatactNumber;

  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    this.obscureText,
    this.onChanged,
    this.labelText,
    this.initialValue,
    this.fillColor,
    this.isConatactNumber = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(
                widget.labelText ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.appBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
              )
            : Container(),
        SizedBox(height: 1.h),
        TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: widget.hintText ?? "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: (widget.fillColor ?? Colors.white).withOpacity(0.1),
              filled: true,
              prefixIcon: widget.icon,
            ),
            obscureText: widget.obscureText ?? false,
            onChanged: widget.onChanged,
            inputFormatters: widget.isConatactNumber
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ]
                : [])
      ],
    );
  }
}
