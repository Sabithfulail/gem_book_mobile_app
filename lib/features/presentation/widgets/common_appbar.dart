import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.baseColor,
      title: Center(
        child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 4.h,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppImages.icNotificationBell,
            height: 3.h,
            color: Colors.transparent,
          ),
          onPressed: () {}, // Call onTap function directly
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}
