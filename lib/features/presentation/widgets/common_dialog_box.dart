import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CommonDialog extends StatefulWidget {
  const CommonDialog({
    super.key,
    required this.title,
    this.description,
    this.color,
    required this.buttonTitle1,
    required this.buttonTitle2,
    required this.onPressBtn1,
    required this.onPressBtn2,
    this.isTwoButton = false,
  });

  final String title;
  final String? description;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function() onPressBtn1;
  final Function() onPressBtn2;
  final Color? color;
  final bool isTwoButton;

  @override
  State<CommonDialog> createState() => _CommonDialogState();
}

class _CommonDialogState extends State<CommonDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        alignment: FractionalOffset.center,
        padding: const EdgeInsets.all(20),
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
          child: Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      widget.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: AppColors.baseColor,
                              ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      widget.description ?? '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.appTextGrayColor,
                          ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 133,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.baseColor, width: 2)),
                          child: Center(
                            child: TextButton(
                                onPressed: widget.onPressBtn1,
                                child: Text(
                                  widget.buttonTitle1,
                                  style: const TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                        if(widget.isTwoButton)
                          const SizedBox(
                          width: 18,
                        ),
                        if(widget.isTwoButton)
                          Container(
                          width: 133,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.baseColor, width: 2),
                            // gradient: AppColors.primaryGradient
                          ),
                          child: Center(
                            child: TextButton(
                                onPressed: widget.onPressBtn2,
                                child: Text(
                                  widget.buttonTitle2,
                                  style: const TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
