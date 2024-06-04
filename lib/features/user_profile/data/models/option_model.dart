import 'package:flutter/material.dart';

class OptionModel {
  final IconData icon;
  final String title;
  final IconData actionIcon;
  final double? iconSize;
  final bool switchButton;
  final VoidCallback? onTap;
  OptionModel({
    required this.icon,
    required this.title,
    required this.actionIcon,
    this.iconSize,
    this.switchButton = false,
    this.onTap,
  });
}
