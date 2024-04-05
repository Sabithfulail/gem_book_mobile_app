import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:gem_book/features/presentation/widgets/gem_add.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../../../utils/routes.dart';
import '../../../services/database_service.dart';
import '../../models/gem_add.dart';
import '../../widgets/base64_image_showing.dart';
import '../../widgets/btn_component.dart';
import '../../widgets/choose_image_component.dart';
import '../../widgets/common_dialog_box.dart';
import '../../widgets/common_snack_bar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/image_border_view.dart';
import '../../widgets/image_showing_image.dart';

class EditPostView extends StatefulWidget {
  final GemAdd gemAdd;

  const EditPostView({super.key, required this.gemAdd});

  @override
  State<EditPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<EditPostView> {
  @override
  initState() {
    type = widget.gemAdd.type;
    name = widget.gemAdd.name;
    price = widget.gemAdd.price;
    weight = widget.gemAdd.weight;
    shape = widget.gemAdd.shape ?? "";
    colour = widget.gemAdd.color ?? "";
    details = widget.gemAdd.details;
    imageGem = widget.gemAdd.imageGem;
    imageCerti = widget.gemAdd.imageCertificate;
    super.initState();
  }

  String type = '';
  String weight = '';
  String shape = '';
  String colour = '';
  String details = '';
  String price = '';
  String name = "";
  String imageGem = "";
  String imageCerti = "";
  final DatabaseService dbService = DatabaseService();

  Uint8List? gemPicBytesImage;
  bool isGemImageFileSelected = false;
  bool gemImageFileCamera = false;
  bool gemImageFilePic = false;
  TextEditingController gemImageController = TextEditingController();
  File gemImageFile = File("");
  String gemImageFileName = "";
  String gemImageFilePath = "";
  String gemImageFileType = "";
  String? gemImagePathBase64 = "";
  String? gemImageData;
  Uint8List? gemBytesImage;

  Uint8List? certificatePicBytesImage;
  bool isCertificateImageFileSelected = false;
  bool certificateImageFileCamera = false;
  bool certificateImageFilePic = false;
  TextEditingController certificateImageController = TextEditingController();
  File certificateImageFile = File("");
  String certificateImageFileName = "";
  String certificateImageFilePath = "";
  String certificateImageFileType = "";
  String? certificateImagePathBase64 = "";
  String? certificateImageData;
  Uint8List? certificateBytesImage;
  bool isEditedGem = false;
  bool isEditedCert = false;

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
                (isEditedGem == false)
                    ? Base64ImageShowingView(
                        base64Image: widget.gemAdd.imageGem,
                        onTapAction: () {
                          showGemDialog(context);
                        })
                    : const SizedBox.shrink(),
                (isGemImageFileSelected == false)
                    ? (isEditedGem == true)
                        ? ImageBorderView(
                            onTapAction: () {
                              showGemDialog(context);
                            },
                          )
                        : const SizedBox.shrink()
                    : (isEditedGem == true)
                        ? ImageShowingView(
                            file: gemImageFile,
                            onTapAction: () {
                              showGemDialog(context);
                            },
                          )
                        : const SizedBox.shrink(),
                SizedBox(height: 2.h),
                CustomTextField(
                  initialValue: name,
                  labelText: AppStrings.name,
                  hintText: AppStrings.enterName,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: type,
                  labelText: AppStrings.type,
                  hintText: AppStrings.enterType,
                  onChanged: (value) {
                    type = value;
                    setState(() {});
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: weight,
                  labelText: AppStrings.weight,
                  hintText: AppStrings.enterWeight,
                  onChanged: (value) {
                    weight = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: price,
                  labelText: AppStrings.priceLKR,
                  hintText: AppStrings.enterPrice,
                  onChanged: (value) {
                    price = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: shape,
                  labelText: AppStrings.shape,
                  hintText: AppStrings.enterShape,
                  onChanged: (value) {
                    shape = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: colour,
                  labelText: AppStrings.colour,
                  hintText: AppStrings.enterColour,
                  onChanged: (value) {
                    colour = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  initialValue: details,
                  labelText: AppStrings.details,
                  hintText: AppStrings.enterDetails,
                  onChanged: (value) {
                    details = value;
                  },
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
                (isEditedCert == false)
                    ? Base64ImageShowingView(
                        base64Image: widget.gemAdd.imageCertificate,
                        onTapAction: () {
                          showCertificateDialog(context);
                        })
                    : const SizedBox.shrink(),
                (isCertificateImageFileSelected == false)
                    ? (isEditedCert == true)
                        ? ImageBorderView(
                            onTapAction: () {
                              showCertificateDialog(context);
                            },
                          )
                        : const SizedBox.shrink()
                    : (isEditedCert == true)
                        ? ImageShowingView(
                            file: certificateImageFile,
                            onTapAction: () {
                              showCertificateDialog(context);
                            },
                          )
                        : const SizedBox.shrink(),
                SizedBox(height: 3.h),

                BtnComponent(
                  title: "Confirm",
                  onTap: () {
                    setState(() {});
                    if (
                        // isGemImageFileSelected == false ||
                        type.isEmpty ||
                            weight.isEmpty ||
                            shape.isEmpty ||
                            colour.isEmpty ||
                            details.isEmpty ||
                            name.isEmpty
                        // || isCertificateImageFileSelected == false
                        ) {
                      CustomSnackBar.show(context, 'Please fill all details');
                    } else {
                      if (isEditedGem == false && isEditedCert == false) {
                        showDialog(
                            context: context,
                            builder: (ctx) => CommonDialog(
                                isTwoButton: true,
                                title: "Are sure",
                                buttonTitle1: "Confirm",
                                buttonTitle2: "Cancel",
                                onPressBtn1: () {
                                  Add add = Add(
                                      imageGem: widget.gemAdd.imageGem,
                                      imageCerti: widget.gemAdd.imageCertificate,
                                      name: name,
                                      price: price,
                                      shape: shape,
                                      type: type,
                                      colour: colour,
                                      details: details,
                                      weight: weight,
                                      sellerName: kUser.lastName ?? "",
                                      contactNumber: kUser.contactNumber ?? "",
                                      email: kUser.emailAddress ?? "",
                                      addID: widget.gemAdd.addID ?? "",
                                      uid: kUser.uid ?? "");
                                  try {
                                    showProgressBar(context);
                                    dbService.updateAdd(
                                        widget.gemAdd.addID ?? "", add);
                                    Navigator.pop(context);
                                  } on FirebaseException catch (e) {
                                    CustomSnackBar.show(context,
                                        'Error adding gem: ${e.message}');
                                    Navigator.pop(context);
                                  } catch (e) {
                                    CustomSnackBar.show(context,
                                        'An unexpected error occurred: $e');
                                    Navigator.pop(context);
                                  }
                                  CustomSnackBar.show(
                                      context, 'Gem edited successfully!');
                                  Navigator.pop(context);
                                  Navigator.popUntil(context,
                                      ModalRoute.withName(Routes.kHomeView));
                                },
                                onPressBtn2: () {
                                  Navigator.pop(context);
                                }));
                      } else if (isEditedGem == true &&
                          isGemImageFileSelected == true && isEditedCert == false) {
                        showDialog(
                            context: context,
                            builder: (ctx) => CommonDialog(
                                isTwoButton: true,
                                title: "Are sure",
                                buttonTitle1: "Confirm",
                                buttonTitle2: "Cancel",
                                onPressBtn1: () {
                                  Add add = Add(
                                      imageGem: imageGem,
                                      imageCerti: widget.gemAdd.imageCertificate,
                                      name: name,
                                      price: price,
                                      shape: shape,
                                      type: type,
                                      colour: colour,
                                      details: details,
                                      weight: weight,
                                      sellerName: kUser.lastName ?? "",
                                      contactNumber: kUser.contactNumber ?? "",
                                      email: kUser.emailAddress ?? "",
                                      addID: widget.gemAdd.imageCertificate,
                                      uid: kUser.uid ?? "");
                                  try {
                                    showProgressBar(context);
                                    dbService.updateAdd(
                                        widget.gemAdd.addID ?? "", add);
                                    Navigator.pop(context);
                                  } on FirebaseException catch (e) {
                                    CustomSnackBar.show(context,
                                        'Error adding gem: ${e.message}');
                                    Navigator.pop(context);
                                  } catch (e) {
                                    CustomSnackBar.show(context,
                                        'An unexpected error occurred: $e');
                                    Navigator.pop(context);
                                  }
                                  CustomSnackBar.show(
                                      context, 'Gem edited successfully!');
                                  Navigator.pop(context);
                                  Navigator.popUntil(context,
                                      ModalRoute.withName(Routes.kHomeView));
                                },
                                onPressBtn2: () {
                                  Navigator.pop(context);
                                }));
                      } else if (isEditedCert == true &&
                          isCertificateImageFileSelected == true && isEditedGem == false) {
                        showDialog(
                            context: context,
                            builder: (ctx) => CommonDialog(
                                isTwoButton: true,
                                title: "Are sure",
                                buttonTitle1: "Confirm",
                                buttonTitle2: "Cancel",
                                onPressBtn1: () {
                                  Add add = Add(
                                      imageGem: widget.gemAdd.imageGem,
                                      imageCerti: imageCerti,
                                      name: name,
                                      price: price,
                                      shape: shape,
                                      type: type,
                                      colour: colour,
                                      details: details,
                                      weight: weight,
                                      sellerName: kUser.lastName ?? "",
                                      contactNumber: kUser.contactNumber ?? "",
                                      email: kUser.emailAddress ?? "",
                                      addID: widget.gemAdd.imageCertificate,
                                      uid: kUser.uid ?? "");
                                  try {
                                    showProgressBar(context);
                                    dbService.updateAdd(
                                        widget.gemAdd.addID ?? "", add);
                                    Navigator.pop(context);
                                  } on FirebaseException catch (e) {
                                    CustomSnackBar.show(context,
                                        'Error adding gem: ${e.message}');
                                    Navigator.pop(context);
                                  } catch (e) {
                                    CustomSnackBar.show(context,
                                        'An unexpected error occurred: $e');
                                    Navigator.pop(context);
                                  }
                                  CustomSnackBar.show(
                                      context, 'Gem edited successfully!');
                                  Navigator.pop(context);
                                  Navigator.popUntil(context,
                                      ModalRoute.withName(Routes.kHomeView));
                                },
                                onPressBtn2: () {
                                  Navigator.pop(context);
                                }));
                      } else if (isEditedCert == true &&
                          isCertificateImageFileSelected == true &&
                          isEditedGem == true &&
                          isGemImageFileSelected == true) {
                        showDialog(
                            context: context,
                            builder: (ctx) => CommonDialog(
                                isTwoButton: true,
                                title: "Are sure",
                                buttonTitle1: "Confirm",
                                buttonTitle2: "Cancel",
                                onPressBtn1: () {
                                  Add add = Add(
                                      imageGem: imageGem,
                                      imageCerti: imageCerti,
                                      name: name,
                                      price: price,
                                      shape: shape,
                                      type: type,
                                      colour: colour,
                                      details: details,
                                      weight: weight,
                                      sellerName: kUser.lastName ?? "",
                                      contactNumber: kUser.contactNumber ?? "",
                                      email: kUser.emailAddress ?? "",
                                      addID: widget.gemAdd.imageCertificate,
                                      uid: kUser.uid ?? "");
                                  try {
                                    showProgressBar(context);
                                    dbService.updateAdd(
                                        widget.gemAdd.addID ?? "", add);
                                    Navigator.pop(context);
                                  } on FirebaseException catch (e) {
                                    CustomSnackBar.show(context,
                                        'Error adding gem: ${e.message}');
                                    Navigator.pop(context);
                                  } catch (e) {
                                    CustomSnackBar.show(context,
                                        'An unexpected error occurred: $e');
                                    Navigator.pop(context);
                                  }
                                  CustomSnackBar.show(
                                      context, 'Gem edited successfully!');
                                  Navigator.pop(context);
                                  Navigator.popUntil(context,
                                      ModalRoute.withName(Routes.kHomeView));
                                },
                                onPressBtn2: () {
                                  Navigator.pop(context);
                                }));
                      } else {
                        CustomSnackBar.show(context, 'Please fill all details');
                      }
                    }
                  },
                ), BtnComponent(
                  title: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showGemDialog(BuildContext context) {
    final sysWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return PopScope(
          canPop: false,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 100 * 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.appTextGrayColor),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 100 * 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: sysWidth / 100 * 15,
                            top: 60.0,
                            right: sysWidth / 100 * 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "open\ncamera",
                                  bgColor: AppColors.appWhiteColor,
                                  iconColor: AppColors.appTextGrayColor,
                                  image: AppImages.cameraSymbol),
                              onTap: () {
                                Navigator.of(context).pop();
                                _showCameraGemImage("");
                              },
                            ),
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "Select from\nGallery",
                                  bgColor: AppColors.appWhiteColor,
                                  iconColor: AppColors.appTextGrayColor,
                                  image: AppImages.iconGallery),
                              onTap: () {
                                Navigator.of(context).pop();
                                _showGalleryGemImage("");
                              },
                            ),
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "Remove\nPicture",
                                  bgColor: AppColors.appContainerRedColor,
                                  iconColor: AppColors.appRedColor,
                                  image: AppImages.iconRemoveImage),
                              onTap: () {
                                setState(() {
                                  gemPicBytesImage = null;
                                  isGemImageFileSelected = false;
                                  isEditedGem = true;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Future _showCameraGemImage(String value) async {
    final pictureFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    // CroppedFile? picture = await ImageCropper().cropImage(
    //   sourcePath: pictureFile!.path,
    //   compressQuality: 100,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.ratio3x2,
    //     CropAspectRatioPreset.original,
    //     CropAspectRatioPreset.ratio4x3,
    //     CropAspectRatioPreset.ratio16x9
    //   ],
    //   uiSettings: [
    //     AndroidUiSettings(
    //         toolbarTitle: 'Cropper',
    //         toolbarColor: AppColors.appBlackColor,
    //         activeControlsWidgetColor: AppColors.appRedColor,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         toolbarWidgetColor: AppColors.appWhiteColor,
    //         lockAspectRatio: false),
    //     IOSUiSettings(
    //       title: 'Cropper',
    //     ),
    //   ],
    // );

    if (pictureFile != null) {
      if (pictureFile.path != "") {
        setState(() {
          gemImageController.clear();
          isGemImageFileSelected = false;
          gemImageFileCamera = true;
          gemImageFile = File(pictureFile.path);
          gemImageFileName = pictureFile.name;
          gemImageFileType = "jpg";
          gemImageFilePath = pictureFile.path;
          gemImagePathBase64 =
              base64Encode(File(pictureFile.path).readAsBytesSync());
          gemImageData = gemImagePathBase64.toString();
          gemBytesImage = base64Decode(gemImageData!);
          gemPicBytesImage = gemBytesImage;
          imageGem = gemImageData!;
          isGemImageFileSelected = true;
          isEditedGem = true;
        });
      }
    } else {
      gemImageFileName = "No File Selected";
      return;
    }
  }

  Future _showGalleryGemImage(String value) async {
    final pictureFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    // CroppedFile? picture = await ImageCropper().cropImage(
    //   sourcePath: pictureFile!.path,
    //   compressQuality: 100,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.ratio3x2,
    //     CropAspectRatioPreset.original,
    //     CropAspectRatioPreset.ratio4x3,
    //     CropAspectRatioPreset.ratio16x9,
    //   ],
    //   uiSettings: [
    //     AndroidUiSettings(
    //         toolbarTitle: 'Cropper',
    //         toolbarColor: AppColors.baseColor,
    //         activeControlsWidgetColor: AppColors.appRedColor,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         toolbarWidgetColor: AppColors.appWhiteColor,
    //         lockAspectRatio: false),
    //     IOSUiSettings(
    //       title: 'Cropper',
    //     ),
    //   ],
    // );
    final picture = pictureFile;

    if (pictureFile!.path != "") {
      setState(() {
        gemImageController.clear();
        isGemImageFileSelected = false;
        gemImageFileCamera = true;
        gemImageFile = File(picture!.path);
        gemImageFileName = pictureFile.name;
        gemImageFileType = "jpg";
        gemImageFilePath = picture.path;
        gemImagePathBase64 = base64Encode(File(picture.path).readAsBytesSync());
        gemImageData = gemImagePathBase64.toString();
        imageGem = gemImageData!;
        gemBytesImage = base64Decode(gemImageData!);
        gemPicBytesImage = gemBytesImage;
        isGemImageFileSelected = true;
        isEditedGem = true;
      });
    } else {
      CustomSnackBar.show(context, "Capture image exceeds 5MB in size.");
    }
  }

  void showCertificateDialog(BuildContext context) {
    final sysWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return PopScope(
          canPop: false,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 100 * 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.appTextGrayColor),
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 100 * 8,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: sysWidth / 100 * 15,
                            top: 60.0,
                            right: sysWidth / 100 * 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "open\ncamera",
                                  bgColor: AppColors.appWhiteColor,
                                  iconColor: AppColors.appTextGrayColor,
                                  image: AppImages.cameraSymbol),
                              onTap: () {
                                Navigator.of(context).pop();
                                _showCameraCertificateImage("");
                              },
                            ),
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "Select from\nGallery",
                                  bgColor: AppColors.appWhiteColor,
                                  iconColor: AppColors.appTextGrayColor,
                                  image: AppImages.iconGallery),
                              onTap: () {
                                Navigator.of(context).pop();
                                _showGalleryCertificateImage("");
                              },
                            ),
                            InkWell(
                              child: const ChooseImageComponent(
                                  title: "Remove\nPicture",
                                  bgColor: AppColors.appContainerRedColor,
                                  iconColor: AppColors.appRedColor,
                                  image: AppImages.iconRemoveImage),
                              onTap: () {
                                setState(() {
                                  certificatePicBytesImage = null;
                                  isCertificateImageFileSelected = false;
                                  isEditedCert = true;
                                });
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  Future _showCameraCertificateImage(String value) async {
    final pictureFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    // CroppedFile? picture = await ImageCropper().cropImage(
    //   sourcePath: pictureFile!.path,
    //   compressQuality: 100,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.ratio3x2,
    //     CropAspectRatioPreset.original,
    //     CropAspectRatioPreset.ratio4x3,
    //     CropAspectRatioPreset.ratio16x9
    //   ],
    //   uiSettings: [
    //     AndroidUiSettings(
    //         toolbarTitle: 'Cropper',
    //         toolbarColor: AppColors.appBlackColor,
    //         activeControlsWidgetColor: AppColors.appRedColor,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         toolbarWidgetColor: AppColors.appWhiteColor,
    //         lockAspectRatio: false),
    //     IOSUiSettings(
    //       title: 'Cropper',
    //     ),
    //   ],
    // );

    if (pictureFile != null) {
      if (pictureFile.path != "") {
        setState(() {
          certificateImageController.clear();
          isCertificateImageFileSelected = false;
          certificateImageFileCamera = true;
          certificateImageFile = File(pictureFile.path);
          certificateImageFileName = pictureFile.name;
          certificateImageFileType = "jpg";
          certificateImageFilePath = pictureFile.path;
          certificateImagePathBase64 =
              base64Encode(File(pictureFile.path).readAsBytesSync());
          certificateImageData = certificateImagePathBase64.toString();
          imageCerti = certificateImageData!;
          certificateBytesImage = base64Decode(certificateImageData!);
          certificatePicBytesImage = certificateBytesImage;
          isCertificateImageFileSelected = true;
          isEditedCert = true;
        });
      }
    } else {
      gemImageFileName = "No File Selected";
      return;
    }
  }

  Future _showGalleryCertificateImage(String value) async {
    final pictureFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    // CroppedFile? picture = await ImageCropper().cropImage(
    //   sourcePath: pictureFile!.path,
    //   compressQuality: 100,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.ratio3x2,
    //     CropAspectRatioPreset.original,
    //     CropAspectRatioPreset.ratio4x3,
    //     CropAspectRatioPreset.ratio16x9,
    //   ],
    //   uiSettings: [
    //     AndroidUiSettings(
    //         toolbarTitle: 'Cropper',
    //         toolbarColor: AppColors.baseColor,
    //         activeControlsWidgetColor: AppColors.appRedColor,
    //         initAspectRatio: CropAspectRatioPreset.original,
    //         toolbarWidgetColor: AppColors.appWhiteColor,
    //         lockAspectRatio: false),
    //     IOSUiSettings(
    //       title: 'Cropper',
    //     ),
    //   ],
    // );
    final picture = pictureFile;

    if (pictureFile!.path != "") {
      setState(() {
        certificateImageController.clear();
        isCertificateImageFileSelected = false;
        certificateImageFileCamera = true;
        certificateImageFile = File(picture!.path);
        certificateImageFileName = pictureFile.name;
        certificateImageFileType = "jpg";
        certificateImageFilePath = picture.path;
        certificateImagePathBase64 =
            base64Encode(File(picture.path).readAsBytesSync());
        certificateImageData = certificateImagePathBase64.toString();
        imageCerti = certificateImageData!;
        certificateBytesImage = base64Decode(certificateImageData!);
        certificatePicBytesImage = certificateBytesImage;
        isCertificateImageFileSelected = true;
        isEditedCert = true;
      });
    } else {
      CustomSnackBar.show(context, "Capture image exceeds 5MB in size.");
    }
  }

  showProgressBar(BuildContext? context) {
    showGeneralDialog(
        context: context!,
        barrierDismissible: false,
        transitionBuilder: (context, a1, a2, widget) {
          return PopScope(
            canPop: false,
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    alignment: FractionalOffset.center,
                    child: Wrap(
                      children: [
                        Container(
                          color: Colors.transparent,
                          // child: SpinKitThreeBounce(
                          //   color: source.baseColor,
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox.shrink();
        });
  }
}
