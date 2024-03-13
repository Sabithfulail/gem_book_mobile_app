import 'package:flutter/material.dart';
import 'package:gem_book/features/presentation/widgets/common_appbar.dart';
import 'package:gem_book/units/app_strings.dart';
import 'package:sizer/sizer.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.addPost,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(1.w),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
