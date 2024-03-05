import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';


import 'dart:io';
import 'dart:typed_data';

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
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(child: Text("Gem Home")),
        leading: GestureDetector(
          child:SvgPicture.asset(
            AppImages.iconMenu,
            width: 0.5.w,
          ),
          onTap: (){
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }


   drawerView (){
    return const Column(
      children: [

      ],
    );
  }
 }