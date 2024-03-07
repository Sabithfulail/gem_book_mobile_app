import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../../../units/app_colors.dart';
import '../../../../units/app_images.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: drawerView(),
      ),
      // appBar: AppBar(
      //   backgroundColor: AppColors.baseColor,
      //   title: const Center(
      //       child: Text(
      //     AppStrings.homeTitle,
      //     style: TextStyle(color: Colors.white),
      //   )),
      //   leading: GestureDetector(
      //     child: SvgPicture.asset(
      //       AppImages.iconMenu,
      //       width: 0.5.w,
      //     ),
      //     onTap: () {
      //       _scaffoldKey.currentState!.openDrawer();
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 17.h),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          child: Column(),
          ),
        )

      ),
    );
  }

  drawerView() {
    return const Column(
      children: [],
    );
  }
}
