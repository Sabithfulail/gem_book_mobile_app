import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:gem_book/features/presentation/widgets/gem_add.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../../../utils/routes.dart';
import '../../widgets/btn_component.dart';
import '../../widgets/common_dialog_box.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/image_border_view.dart';

class EditPostView extends StatefulWidget {
  final GemAdd gemAdd;
  const EditPostView({super.key, required this.gemAdd});

  @override
  State<EditPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<EditPostView> {

  @override
  void initState() {
    type = widget.gemAdd.type;
    weight = widget.gemAdd.weight;
    // shape = widget.gem.;
    colour = widget.gemAdd.color!;
    // treatment = widget.gem.;
    super.initState();
  }
  String type = '';
  String weight = '';
  String shape = '';
  String colour = '';
  String details = '';
  String price = '';
  String name ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.edit,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppStrings.editPostDescription,
                  style: AppStyling.boldTextSize20.copyWith(
                    color: AppColors.appSummaryTextDarkBlueColor,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "picture of Gem",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                ImageBorderView(onTapAction: () {  },),
                SizedBox(height: 2.h),
                CustomTextField(
                  initialValue: name,
                  labelText: AppStrings.name,
                  hintText: AppStrings.enterName,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: type,
                  labelText: AppStrings.type,
                  hintText: AppStrings.enterType,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: weight,
                  labelText: AppStrings.weight,
                  hintText: AppStrings.enterWeight,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: price,
                  labelText: AppStrings.priceLKR,
                  hintText: AppStrings.enterPrice,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: shape,
                  labelText: AppStrings.shape,
                  hintText: AppStrings.enterShape,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: colour,
                  labelText: AppStrings.colour,
                  hintText: AppStrings.enterColour,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: details,
                  labelText: AppStrings.details,
                  hintText: AppStrings.enterDetails,
                  onChanged: (value) {},
                ),
                SizedBox(height: 3.h),
                Text(
                  "picture of GemStone Certificate",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                ImageBorderView(onTapAction: () {  },),
                SizedBox(height: 3.h),
                BtnComponent(
                  title: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                BtnComponent(
                  title: "Conform",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => CommonDialog(
                            isTwoButton: true,
                            title: "Are sure",
                            buttonTitle1: "Conform",
                            buttonTitle2: "Cancel",
                            onPressBtn1: () {
                              Navigator.pop(context);
                              Navigator.popUntil(
                                  context, ModalRoute.withName(Routes.kHomeView));
                            },
                            onPressBtn2: () {
                              Navigator.pop(context);
                            }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
