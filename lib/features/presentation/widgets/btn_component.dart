import 'package:flutter/material.dart';
import 'package:gem_book/units/app_colors.dart';
import 'package:sizer/sizer.dart';

class BtnComponent extends StatefulWidget {
  final String title;
  final Color? color;
  final Function() onTap;

   const BtnComponent({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  State<BtnComponent> createState() => _BtnComponentState();
}

class _BtnComponentState extends State<BtnComponent> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(
              bottom: 1.h
            ),
            child: Container(
              height: 7.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.color ?? AppColors.baseColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.color != null ? Colors.black : Colors.white,
                    fontSize: 2.3.h
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
