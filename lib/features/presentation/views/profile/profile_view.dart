import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/gem_add.dart';
import 'package:gem_book/utils/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../../../utils/routes.dart';
import '../../widgets/common_appbar.dart';
import '../../widgets/gem_card.dart';
import '../../widgets/gem_details_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName = "Abdhul Fathir";
  String mobileNumber = "0772536543";
  String mailAddress = "GemSeller@gmail.com";
  List<GemAdd> listGems = [
    GemAdd(
        imageGem: AppImages.intoImg,
        imageCertificate: AppImages.intoImg,
        name: 'Sapphire',
        price: '12000',
        type: 'Sep',
        color: "red",
        details: "very good",
        weight: "5"),
    GemAdd(
        imageCertificate: AppImages.intoImg,
        imageGem: AppImages.intoImg,
        name: 'Sapphire',
        price: '12000',
        type: 'Sep',
        color: "red",
        details: "very good",
        weight: "5"),
    GemAdd(
        imageCertificate: AppImages.intoImg,
        imageGem: AppImages.intoImg,
        name: 'Sapphire',
        price: '12000',
        type: 'Sep',
        color: "red",
        details: "very good",
        weight: "5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.profile,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15.h,
              decoration: BoxDecoration(gradient: AppColors.primaryGradient),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: AppStyling.boldTextSize20
                          .copyWith(color: AppColors.appWhiteColor),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              mobileNumber,
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Email Address",
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                             SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              mailAddress,
                              style: TextStyle(
                                fontSize: 1.5.h,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 85.h, // Set a fixed height for the list view
              child: ListView.builder(
                itemCount: listGems.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GemCardWidget(
                    imagePath: listGems[index].imageGem,
                    name: listGems[index].name,
                    price: listGems[index].price,
                    onTapCallback: () {
                      Navigator.pushNamed(context, Routes.kGemDetailView,
                      arguments: GemDetailArguments( gemAdd: listGems[index],isEditable: true));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
