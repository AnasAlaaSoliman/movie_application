import 'package:flutter/material.dart';


import '../../../models/onboarding_data_model.dart';

import 'elevated_button__custom_widget.dart';

class CustomOnboardingWidget extends StatelessWidget {
  final OnboardingDataModel onboardingDataModel;
  final ElevatedButtonCustomWidget? nextElevatedButton;
  final ElevatedButtonCustomWidget? backElevatedButton;
  final Color containerColor;
  final double? fontSizeTitle;
  final FontWeight titleFontWeight;
  final Color? textColor;
 final LinearGradient linearGradient;

  const CustomOnboardingWidget({
    super.key,
    required this.onboardingDataModel,
    required this.containerColor,
    this.fontSizeTitle,
    required this.titleFontWeight,
    this.nextElevatedButton,
    this.backElevatedButton,
    this.textColor,
    required this.linearGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
clipBehavior: Clip.antiAlias,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardingDataModel.image),
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: BoxDecoration(
            gradient:linearGradient
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    onboardingDataModel.title,
                    style: TextStyle(
                      fontSize: fontSizeTitle,
                      fontWeight: titleFontWeight,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  (onboardingDataModel.description != null)
                      ? Text(
                          onboardingDataModel.description!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 10),
                  nextElevatedButton!,
                  SizedBox(height: 10),
                  (backElevatedButton != null)
                      ? backElevatedButton!
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
