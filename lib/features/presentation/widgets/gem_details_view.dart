import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/routes.dart';
import '../../services/database_service.dart';
import 'btn_component.dart';
import 'common_dialog_box.dart';
import 'common_snack_bar.dart';
import 'gem_add.dart';

class GemDetailArguments {
  final GemAdd gemAdd;
  final bool isEditable;

  const GemDetailArguments({required this.gemAdd, this.isEditable = false});
}

class GemDetailView extends StatefulWidget {
  final GemDetailArguments gemDetailArguments;

  const GemDetailView({super.key, required this.gemDetailArguments});

  @override
  State<GemDetailView> createState() => _GemDetailViewState();
}

class _GemDetailViewState extends State<GemDetailView> {
  final DatabaseService dbService = DatabaseService();
  Uint8List?  imageGem;
  Uint8List?  imageCert;
  int itemCount = 0;
  @override
  void initState() {
    super.initState();
    imageGem = base64Decode(widget.gemDetailArguments.gemAdd.imageGem);
    imageCert = base64Decode(widget.gemDetailArguments.gemAdd.imageCertificate);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: AppStrings.details,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                  image:  DecorationImage(
                    image: MemoryImage(imageGem!),
                  ),),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.gemDetailArguments.gemAdd.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _gemDetailView(AppStrings.priceLKR,
                      widget.gemDetailArguments.gemAdd.price),
                  _gemDetailView(
                      AppStrings.type, widget.gemDetailArguments.gemAdd.type),
                  _gemDetailView(AppStrings.colour,
                      widget.gemDetailArguments.gemAdd.color ?? ""),
                  _gemDetailView(AppStrings.weight,
                      widget.gemDetailArguments.gemAdd.weight),
                  _gemDetailView(AppStrings.shape,
                      widget.gemDetailArguments.gemAdd.shape??''),
                  _gemDetailView(AppStrings.details,
                      widget.gemDetailArguments.gemAdd.details),
                  _gemDetailView(AppStrings.sellerName,
                      widget.gemDetailArguments.gemAdd.sellerName??""),
                  _gemDetailView(AppStrings.contactNumber,
                      widget.gemDetailArguments.gemAdd.sellerContactNumber??""),
                  _gemDetailView(AppStrings.contactNumber,
                      widget.gemDetailArguments.gemAdd.gemAddID??""),
                  SizedBox(height: 2.h),
                  Center(
                    child: Text(
                      "Certificate Image",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.appBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Center(
                    child: Container(
                      width: 80.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.appLightGrayColor),
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,

                          image:MemoryImage(imageCert!),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  if (widget.gemDetailArguments.isEditable == true)
                    BtnComponent(
                      title: AppStrings.edit,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.kEditPostView,
                        arguments: widget.gemDetailArguments.gemAdd);
                      },
                    ),
                  if (widget.gemDetailArguments.isEditable == true)
                    BtnComponent(
                      title: AppStrings.delete,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => CommonDialog(
                                isTwoButton: true,
                                title: "Are sure",
                                buttonTitle1: "Delete",
                                buttonTitle2: "Cancel",
                                onPressBtn1: () async {
                                  try{
                                     dbService.deleteAdd(widget.gemDetailArguments.gemAdd.gemAddID??"");
                                     CustomSnackBar.show(context, 'Successfully deleted');
                                  }catch(e){
                                    print(e);
                                    CustomSnackBar.show(context, 'error : $e');
                                  }

                                  Navigator.popUntil(
                                      context, ModalRoute.withName(Routes.kHomeView));
                                },
                                onPressBtn2: () {
                                  Navigator.pop(context);
                                }));
                      },
                    ),
                  SizedBox(height: 1.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_gemDetailView(String title, String data) {
  return Padding(
    padding: EdgeInsets.only(bottom: 1.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text(data,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
