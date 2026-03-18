import 'package:flutter/material.dart';
import 'package:movie2_application/core/theme/App_assets.dart';
import 'package:movie2_application/core/theme/color_pallete.dart';

class MovieStatsCardWidget extends StatelessWidget {
  final Widget svg;
  final String statsNumbers;
  const MovieStatsCardWidget({
    super.key,
    required this.svg,
    required this.statsNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 47,
      decoration: BoxDecoration(
        color: ColorPallete.gray,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svg,
          SizedBox(width: 10),
          Text(
            statsNumbers,
            style: TextStyle(
              fontSize: 24,
              color: ColorPallete.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}