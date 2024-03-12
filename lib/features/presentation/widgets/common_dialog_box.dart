import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.title,
    this.description,
    this.color,
    required this.buttonTitle1,
    required this.buttonTitle2,
    required this.onPressBtn1,
    required this.onPressBtn2,
  });

  final String title;
  final String? description;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function() onPressBtn1;
  final Function() onPressBtn2;
  final Color? color;

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
                      title,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: AppColors.baseColor,
                              ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      description ?? '',
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
                                onPressed: onPressBtn1,
                                child: Text(
                                  buttonTitle1,
                                  style: const TextStyle(color: Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
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
                                onPressed: onPressBtn2,
                                child: Text(
                                  buttonTitle2,
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
