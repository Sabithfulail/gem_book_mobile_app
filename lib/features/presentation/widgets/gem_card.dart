import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_strings.dart';

class GemCardWidget extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  final VoidCallback onTapCallback;

  const GemCardWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.price,
      required this.onTapCallback,
      });

  @override
  State<GemCardWidget> createState() => _GemCardWidgetState();
}

class _GemCardWidgetState extends State<GemCardWidget> {

  @override
  Widget build(BuildContext context) {
    Uint8List?  decodedBytes = base64Decode(widget.imagePath);
    // try{
    //    decodedBytes = base64Decode(widget.imagePath);
    // }catch(e){
    //
    // }
    return InkWell(
      onTap: () => widget.onTapCallback(),
      child: Padding(
        padding: EdgeInsets.only(left: 2.h,top: 1.5.h,right: 2.h),
        child: Container(
          height: 68.w,
            width: 45.w,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(16.0),
              color:  const Color(0xffe8ecf1),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.5.h),
              child: Column(
                children: [
                  Image.memory(
                    fit: BoxFit.fill,
                    decodedBytes,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.priceLKR,
                        style: TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                            color: Color(0xffFF324B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
