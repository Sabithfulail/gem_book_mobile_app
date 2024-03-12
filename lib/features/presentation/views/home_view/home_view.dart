import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_book/features/presentation/widgets/gem_card.dart';
import 'package:gem_book/utils/app_strings.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_styling.dart';
import '../../../../utils/routes.dart';
import '../../widgets/common_dialog_box.dart';
import '../../widgets/gem.dart';

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
  List<Gem> listGems = [
    Gem(
        imagePath: AppImages.intoImg,
        name: 'Sapphire ',
        price: '12000',
        type: 'Sep'),
    Gem(
        imagePath: AppImages.intoImg,
        name: 'Topaz ',
        price: '300000',
        type: 'Top'),
    Gem(
        imagePath: AppImages.intoImg,
        name: 'Amethyst',
        price: '1300',
        type: 'Ame'),
    Gem(
        imagePath: AppImages.intoImg,
        name: 'Aquamarine',
        price: '14200',
        type: 'Aqu'),
  ];

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
                padding: EdgeInsets.only(
                  bottom: 2.h,
                  top: 2.h,
                  left: 2.w,
                  right: 2.w,
                ),
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
            _seeAllView(context, "Categories", () {}),
            SizedBox(
              height: 130,
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
            ),
            SizedBox(height: 2.h),
            // GridView.builder(
            //   itemCount: listGems.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (BuildContext context, int index) {
            //     GemCardWidget(
            //       imagePath: listGems[index].imagePath,
            //       name: listGems[index].name,
            //       price: listGems[index].price,
            //       onTapCallback: () {  },
            //     );
            //   },
            //
            // ),
            // Container(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GridView(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     children: List.generate(
            //         listGems.length,
            //         (index) => GemCardWidget(
            //               imagePath: listGems[index].imagePath,
            //               name: listGems[index].name,
            //               price: listGems[index].price,
            //               onTapCallback: () {},
            //             ),
            //     ),
            //   ),
            // ),
            Row(
              children: [
                GemCardWidget(
                    imagePath: listGems[0].imagePath,
                    name: listGems[0].name,
                    price: listGems[0].price,
                    onTapCallback: () {}),
                GemCardWidget(
                    imagePath: listGems[0].imagePath,
                    name: listGems[0].name,
                    price: listGems[0].price,
                    onTapCallback: () {}),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    // setState(() {
                    //   if(listGems[0].isFavourite == false){
                    //     listGems[0].isFavourite =true;
                    //   }else{
                    //     listGems[0].isFavourite = false;
                    //   }
                    // });
                  },
                  child: GemCardWidget(
                      imagePath: listGems[0].imagePath,
                      name: listGems[0].name,
                      price: listGems[0].price,
                      isFavourite: true,
                      onTapCallback: () {}),
                ),
                GemCardWidget(
                    imagePath: listGems[0].imagePath,
                    name: listGems[0].name,
                    price: listGems[0].price,
                    isFavourite: true,
                    onTapCallback: () {}),
              ],
            ),
            SizedBox(height: 5.h)
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _drawerView() {
    return Drawer(
      width: 70.w,
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
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.profile_circled),
            ),
            title: Text(AppStrings.profile,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.settings),
            ),
            title: Text(AppStrings.settings,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(CupertinoIcons.phone),
            ),
            title: Text(AppStrings.contactUs,
                style: AppStyling.bold500TextSize16
                    .copyWith(color: AppColors.baseColor)),
            onTap: () {
              Navigator.pushNamed(context, Routes.kContactUsPage);
            },
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => CommonDialog(
                      title: "Are sure",
                      buttonTitle1: "Logout",
                      buttonTitle2: "Cancel",
                      onPressBtn1: () {
                        Navigator.pop(context);
                        Navigator.popUntil(
                            context, ModalRoute.withName(Routes.kLoginView));
                      },
                      onPressBtn2: () {
                        Navigator.pop(context);
                      }));
            },
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
        } else if (index == 2) {

        }
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
          onPressed: () {
            Navigator.pushNamed(context, Routes.kNotificationView);
          }, // Call onTap function directly
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
      padding: const EdgeInsets.all(10),
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
    );
  }
}
