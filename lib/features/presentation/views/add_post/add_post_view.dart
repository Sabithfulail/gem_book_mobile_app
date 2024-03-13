import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../widgets/btn_component.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/image_border_view.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  String type = '';
  String weight = '';
  String shape = '';
  String colour = '';
  String treatment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.addPost,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppStrings.addPostDescription,
                  style: AppStyling.boldTextSize20.copyWith(
                    color: AppColors.appSummaryTextDarkBlueColor,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "Upload a picture of Gem",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.appBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 1.h),
                ImageBorderView(onTapAction: () {  },),
                SizedBox(height: 2.h),
                CustomTextField(
                  labelText: AppStrings.type,
                  hintText: AppStrings.enterType,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.weight,
                  hintText: AppStrings.enterWeight,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.shape,
                  hintText: AppStrings.enterShape,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.colour,
                  hintText: AppStrings.enterColour,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.treatment,
                  hintText: AppStrings.enterTreatmentDetails,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                Text(
                  "Upload a picture of GemStone Certificate",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                ImageBorderView(onTapAction: () {  },),
                SizedBox(height: 3.h),
                BtnComponent(
                  title: "Post",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
