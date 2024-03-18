import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';

class ImageShowingView extends StatefulWidget {
  final File file;
  final VoidCallback onTapAction;



  const ImageShowingView({super.key,
    required this.file,  required this.onTapAction,
   });

  @override
  State<ImageShowingView> createState() => _ImageShowingViewState();
}

class _ImageShowingViewState extends State<ImageShowingView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapAction,
      child: Container(
        width: 70.w,
        // height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.appLightGrayColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      height: 25.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                           image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: FileImage(widget.file),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
