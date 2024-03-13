import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:gem_book/features/presentation/widgets/gem.dart';
import 'package:gem_book/units/app_images.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';

class GemDetailView extends StatefulWidget {
  final Gem gem;

  const GemDetailView({super.key, required this.gem});

  @override
  State<GemDetailView> createState() => _GemDetailViewState();
}

class _GemDetailViewState extends State<GemDetailView> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: AppStrings.forgotPassword,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color(0xffF3F5F7),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 140.0)),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.intoImg))),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.gem.name ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _gemDetailView(AppStrings.priceLKR,widget.gem.price),
                  _gemDetailView(AppStrings.priceLKR,widget.gem.name),
                  SizedBox(height: 5.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_gemDetailView(String title , String data){
  return Padding(
    padding:  EdgeInsets.only(
      bottom: 1.h
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text(data ?? "",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}


