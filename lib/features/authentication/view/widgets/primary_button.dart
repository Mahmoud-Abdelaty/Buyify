import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../animations/button_animation.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  final bool isBorder;
  const PrimaryButton({
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.isBorder = false,
    this.fontSize,
    this.color,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonAnimation(
      onTap: onTap,
      child: Container(
        height: height ?? 55,
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
            color: color ?? AppColors.navy_black,
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            border: isBorder ? Border.all(color: AppColors.navy_black) : null),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
