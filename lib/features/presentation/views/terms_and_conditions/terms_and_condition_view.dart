import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/routes.dart';
import '../../widgets/btn_component.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.baseColor,
        title: Row(
          children: [
            SizedBox(width: 40,),
            Text("Terms & Conditions",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45.0,bottom: 25,left: 25,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Terms And Condtions",style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w900),),
                  SizedBox(height: 10,),
                  Text("1.")
                ],
              ),
            ),
            Column(
              children: [
                BtnComponent(
                  title: "Accept",
                  onTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(Routes.kLoginView));
                  },
                ),
                BtnComponent(
                  title: "Decline",
                  color: Colors.grey,
                  onTap: () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(Routes.kLoginView));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
