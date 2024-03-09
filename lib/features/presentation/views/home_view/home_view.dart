import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../../../units/app_colors.dart';
import '../../../../units/app_images.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../../units/app_styling.dart';
import '../../../../units/routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String userName = "Abdhul Fathir";
  String agentId = "";
  String batchId = "";
  String mobileNumber = "077771234124";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawerView(),
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(2.w),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffF3F5F7),
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Category",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.appTextGrayColor,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.all(16),
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: AppColors.baseColor,
                        ),
                      )),
                )),
            const SizedBox(height: 10),
            _seeAllView(context, "Categories", () {
              print("Hi");
            }),
            // Row(
            //   children: [
            //     _categoriesView(AppImages.icGem, "Ruby"),
            //   ],
            // ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                  _categoriesView(AppImages.icGem, "Ruby"),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _drawerView() {
    return Drawer(
      width: 60.w,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: AppStyling.boldTextSize20
                      .copyWith(color: AppColors.appWhiteColor),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ":",
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              mobileNumber,
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              ":",
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              mobileNumber,
                              style: AppStyling.normalTextSize14
                                  .copyWith(color: AppColors.appWhiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.profile_circled),
            ),
            title: Text(AppStrings.forgotPassword,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.profile_circled),
            ),
            title: Text(AppStrings.forgotPassword,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.profile_circled),
            ),
            title: Text(AppStrings.forgotPassword,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.profile_circled),
            ),
            title: Text(AppStrings.contactUs,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          const Spacer(),
          ListTile(
            tileColor: AppColors.baseColor,
            leading: const SizedBox(
              child: Icon(CupertinoIcons.arrow_down_left),
            ),
            title: Text(AppStrings.logout,
                style:
                    AppStyling.bold500TextSize16.copyWith(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  _bottomNavigationBar() {
    return CurvedNavigationBar(
      index: 1,
      items: const <Widget>[
        Icon(CupertinoIcons.home, size: 30, color: Colors.white),
        Icon(CupertinoIcons.add, size: 30, color: Colors.white),
        Icon(CupertinoIcons.profile_circled, size: 30, color: Colors.white),
      ],
      color: AppColors.baseColor,
      buttonBackgroundColor: Colors.redAccent,
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index) {
        if (index == 0) {
          // Navigator.pushNamed(context, Routes.kIntroPage);
        } else if (index == 1) {
        } else if (index == 2) {}
        setState(() {});
      },
      letIndexChange: (page) => true,
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: AppColors.baseColor,
      title: const Center(
          child: Text(
        AppStrings.welcome,
        style: TextStyle(color: Colors.white),
      )),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 4.h,
        ),
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppImages.icNotificationBell,
            height: 3.h,
          ),
          onPressed: () {}, // Call onTap function directly
        ),
      ],
    );
  }

  Widget _seeAllView(BuildContext context, String name, Function function) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              function();
            },
            child: const Text(
              AppStrings.seeAll,
              style: TextStyle(
                  fontSize: 14, color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesView(String imagePath, String catName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        flex: 1,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffF3F5F7),
              radius: 32,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  imagePath,
                  scale: 4.0,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              catName,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
