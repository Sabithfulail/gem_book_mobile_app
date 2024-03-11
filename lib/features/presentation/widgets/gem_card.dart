import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GemCardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final VoidCallback onTapCallback;
  final bool isFavourite;

  const GemCardWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.price,
      required this.onTapCallback,
      this.isFavourite = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCallback(),
      child: Padding(
        padding: EdgeInsets.only(left: 1.5.h,top: 1.5.h),
        child: Container(
          height: 68.w,
            width: 45.w,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(16.0),
              color:  const Color(0xffF3F5F7),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.5.h),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                       SizedBox(width: 15.w),
                       isFavourite
                           ?const Icon(
                         CupertinoIcons.heart_fill,
                         color: Colors.red,
                         size: 32,
                       )
                           :const Icon(
                         CupertinoIcons.heart,
                         size: 32,
                       )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
