import 'package:flutter/material.dart';

import '../../../../core/utils/app_icons.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPressed});
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(AppIcons.arrow_left_2),
    );
  }
}
