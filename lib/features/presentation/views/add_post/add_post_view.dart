import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/models/gem_add.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:gem_book/utils/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/app_styling.dart';
import '../../../services/database_service.dart';
import '../../widgets/btn_component.dart';
import '../../widgets/choose_image_component.dart';
import '../../widgets/common_snack_bar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/image_border_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/image_showing_image.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
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
  Interpreter? interpreter;

  @override
  void initState() {
    super.initState();
    loadModel(); // Load the model in initState
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/gemBook_model.tflite');
    } on Exception catch (e) {
      print('Error loading model: $e');
    }
  }
  //
  Future<String> runInference(File imageFile) async {
    var imageData = await imageFile.readAsBytes();
    var inputShape = interpreter!.getInputTensor(0).shape;
    var outputShape = interpreter!.getOutputTensor(0).shape;
    var numElements = inputShape[0] * inputShape[1] * inputShape[2];
    var inputList = List<double>.generate(numElements, (i) => imageData[i] / 255.0); // Normalize image data
    var outputList = List<double>.filled(outputShape[0], 0);
    interpreter!.run(inputList, outputList);
    print("***************************`${outputList.toString()}`*********************************");
    return outputList.toString();
  }

  String getGemTypeFromOutput(List<num> output) {
    return "Replace with your logic to get gem type from output";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: AppStrings.addPost,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  AppStrings.addPostDescription,
                  style: AppStyling.boldTextSize20.copyWith(
                    color: AppColors.appSummaryTextDarkBlueColor,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  "Upload a picture of Gem",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                isGemImageFileSelected == false
                    ? ImageBorderView(
                  onTapAction: () {
                    showGemDialog(context);
                  },
                )
                    : ImageShowingView(
                  file: gemImageFile,
                  onTapAction: () {
                    showGemDialog(context);
                  },
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  labelText: AppStrings.name,
                  hintText: AppStrings.enterName,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.type,
                  hintText: AppStrings.enterType,
                  onChanged: (value) {
                    type = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.weight,
                  hintText: AppStrings.enterWeight,
                  onChanged: (value) {
                    weight = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.priceLKR,
                  hintText: AppStrings.enterPrice,
                  onChanged: (value) {
                    price = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.shape,
                  hintText: AppStrings.enterShape,
                  onChanged: (value) {
                    shape = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.colour,
                  hintText: AppStrings.enterColour,
                  onChanged: (value) {
                    colour = value;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  labelText: AppStrings.details,
                  hintText: AppStrings.enterDetails,
                  onChanged: (value) {
                    details = value;
                  },
                ),
                SizedBox(height: 3.h),
                Text(
                  "Upload a picture of GemStone Certificate",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),
                isCertificateImageFileSelected == false
                    ? ImageBorderView(
                  onTapAction: () {
                    showCertificateDialog(context);
                  },
                )
                    : ImageShowingView(
                  file: certificateImageFile,
                  onTapAction: () {
                    showCertificateDialog(context);
                  },
                ),
                SizedBox(height: 3.h),
                BtnComponent(
                  title: "Post",
                  onTap: () async {
                    if (isGemImageFileSelected == false ||
                        type.isEmpty ||
                        weight.isEmpty ||
                        shape.isEmpty ||
                        colour.isEmpty ||
                        details.isEmpty ||
                        isCertificateImageFileSelected == false) {
                      CustomSnackBar.show(context, 'Please fill all details');
                    } else {
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
                          addID: "",
                          uid: kUser.uid??"");
                      try {
                        showProgressBar(context);
                        dbService.addAGemAdd(add);
                        Navigator.pop(context);
                      } on FirebaseException catch (e) {
                        CustomSnackBar.show(context, 'Error adding gem: ${e.message}');
                        Navigator.pop(context);
                      } catch (e) {
                        CustomSnackBar.show(context, 'An unexpected error occurred: $e');
                        Navigator.pop(context);
                      }
                      CustomSnackBar.show(context, 'Gem added successfully!');
                      Navigator.popUntil(context, ModalRoute.withName(Routes.kHomeView));
                    }
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
        });
        await runInference(gemImageFile);
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
      });
      runInference(gemImageFile);
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

//  Future _showCameraGemImage(String value) async {
//     final pictureFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       imageQuality: 100,
//       preferredCameraDevice: CameraDevice.rear,
//     );
//
//     CroppedFile? picture = await ImageCropper().cropImage(
//       sourcePath: pictureFile!.path,
//       compressQuality: 100,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: AppColors.appBlackColor,
//             activeControlsWidgetColor: AppColors.appRedColor,
//             initAspectRatio: CropAspectRatioPreset.original,
//             toolbarWidgetColor: AppColors.appWhiteColor,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         ),
//       ],
//     );
//     if (picture != null) {
//       final compressedImage =
//       await FlutterNativeImage.compressImage(pictureFile.path, quality: 50);
//       File pictureFileSize = File(picture.path);
//       if (pictureFileSize.lengthSync() <= 3 * 1024 * 1024) {
//         if (pictureFile.path != "") {
//           setState(() {
//             gemImageController.clear();
//             isGemImageFileSelected = false;
//             gemImageFileCamera = true;
//             gemImageFile = File(picture.path);
//             gemImageFileName = pictureFile.name;
//             gemImageFileType = "jpg";
//             gemImageFilePath = picture.path;
//             gemImagePathBase64 =
//                 base64Encode(File(picture.path).readAsBytesSync());
//             gemImageData = gemImagePathBase64.toString();
//             gemBytesImage = base64Decode(gemImageData!);
//             gemPicBytesImage = gemBytesImage;
//             isGemImageFileSelected = true;
//           });
//         }
//       }
//     } else {
//       gemImageFileName = "No File Selected";
//       return;
//     }
//   }