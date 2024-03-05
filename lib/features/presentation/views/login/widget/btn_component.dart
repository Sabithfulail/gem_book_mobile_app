import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BtnComponent extends StatefulWidget {
  final String title;
  final Color? color;

  const BtnComponent({
    super.key,
    required this.title,
    this.color,
  });

  @override
  State<BtnComponent> createState() => _BtnComponentState();
}

class _BtnComponentState extends State<BtnComponent> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 7.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.color ?? Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.color != null ? Colors.black : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
