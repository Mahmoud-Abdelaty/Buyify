import 'package:Buyify/core/utils/app_colors.dart';
import 'package:animated_loading_indicators/animated_loading_indicators.dart';
import 'package:flutter/material.dart';

class UpDownLoaderWidget extends StatelessWidget {
  const UpDownLoaderWidget({super.key, this.firstColor = AppColors.white});

  final Color firstColor;
  @override
  Widget build(BuildContext context) {
    return UpDownLoader(
      size: 4,
      duration: const Duration(milliseconds: 200),
      firstColor: firstColor,
    );
  }
}
