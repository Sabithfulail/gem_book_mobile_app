import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styling.dart';

class ChooseImageComponent extends StatelessWidget {
  final Color? iconColor;
  final Color? bgColor;
  final String image;
  final String? title;

  const ChooseImageComponent(
      {super.key,
        required this.image,
        this.iconColor,
        this.bgColor,
        this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor!,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              color: iconColor,
              image,
              width: 69,
              height: 69,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: AppStyling.normalTextSize14.copyWith(
            color: AppColors.appTextGrayColor,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
