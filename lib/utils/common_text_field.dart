import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'app_colors.dart';
import 'app_images.dart';


class CommonTextField extends StatefulWidget {
  const CommonTextField(
      {super.key,
        this.hintText,
        this.labelText,
        this.strengthCheck = false,
        this.obscureText = false,
        this.textEditingController,
        this.textInputAction,
        this.onChanged,
        this.inputType,
        this.maxLength,
        this.initialValue,
        this.isEnable,
        this.isGrayTitle,
        this.inputFormatters,
      });

  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final bool obscureText;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final bool strengthCheck;
  final String? initialValue;
  final bool? isEnable;
  final bool? isGrayTitle;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CommonTextField> createState() =>
      _CommonTextFieldState();
}

class _CommonTextFieldState
    extends State<CommonTextField> {
  bool isVisible = false;
  bool isFilled = false;
  bool check = false;

  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    super.initState();
  }

  // @override
  // void dispose() {
  //   widget.textEditingController!.dispose();
  //   _focusNode.removeListener(() {});
  //   _focusNode.dispose();
  //   super.dispose();
  // }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        isFilled = false;
      });
    } else {
      setState(() {
        isFilled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Text(
          widget.labelText!,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: widget.isGrayTitle == true? AppColors.appLightGrayColor :AppColors.appBlackColor,
            fontWeight: FontWeight.bold,
          ),
        )
            : Container(),
        TextFormField(
          buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) =>
          null,
          enabled: widget.isEnable ?? true,
          initialValue: widget.initialValue,
          controller: widget.textEditingController,
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,
          focusNode: _focusNode,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: widget.inputType,
          obscureText: widget.obscureText && !isVisible,
          inputFormatters:
          widget.inputFormatters != null ? widget.inputFormatters! : [],
          cursorColor: AppColors.appTextGrayColor,
          style: Theme.of(context).textTheme.headlineSmall,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appTextDarkGray),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.appBlackColor),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.appLightGrayColor),
            fillColor: AppColors.appTextFieldFillColor,
            filled: isFilled,
            suffixIcon: widget.obscureText
                ? Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: SvgPicture.asset(
                  isVisible
                      ? AppImages.iconVisibilityShow
                      : AppImages.iconVisibilityHide,
                  color: AppColors.appSummaryTextDarkBlueColor,
                  // width: 15,
                  // height: 15,
                ),
              ),
            )
                : null,
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
