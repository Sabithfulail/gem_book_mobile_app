import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_images.dart';

class ImageBorderView extends StatefulWidget {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double padding;
  final double iconSize;
  final double height;
  final VoidCallback onTapAction;
  final bool isReject;
  final String title;

  const ImageBorderView({
    super.key,
    required this.onTapAction,
    this.color = Colors.red,
    this.strokeWidth = 1,
    this.radius = 4,
    this.padding = 6,
    this.iconSize = 48,
    this.height = 150,
    this.isReject = false,
    this.title = "Open the camera and capture the image",
  });

  @override
  State<ImageBorderView> createState() => _ImageBorderViewState();
}

class _ImageBorderViewState extends State<ImageBorderView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTapAction,
        child: Column(
          children: [
            Container(
              width: 65.w,
              // height: 20.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    width: 1,
                    color: widget.isReject == true
                        ? Colors.red
                        : Colors.black38),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 3.w, right: 3.w, top: 1.5.h, bottom: 1.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.cameraSymbol,
                        color:  Colors.black),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text("Open Camera",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    SizedBox(
                      height: 0.7.h,
                    ),
                    Text("or",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 0.6.h,
                    ),
                    Text("Upload from Gallery",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    SizedBox(
                      height: 1.h,
                    ),
                    //Icon(
                    // CupertinoIcons.add_circled_solid,
                    // color: AppColors.primaryBlueColor,
                    // size: iconSize,
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height:10)
          ],
        ));
  }
}
