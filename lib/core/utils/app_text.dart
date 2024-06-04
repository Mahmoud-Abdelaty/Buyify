import 'package:flutter/material.dart';

class AppTextStyle {
  static const String _fontFamily = "DMSans";

  static TextStyle thin({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );

  static TextStyle light({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );

  static TextStyle regular({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );

  static TextStyle medium({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        color: color,
        overflow: overflow,
        decoration: decoration,
        fontSize: fontSize,
      );
  static TextStyle semiBold({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        color: color,
        overflow: overflow,
        decoration: decoration,
        fontSize: fontSize,
      );

  static TextStyle bold({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );

  static TextStyle extraBold({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );

  static TextStyle black({
    Color? color,
    double? fontSize,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: color,
        overflow: overflow,
        decoration: decoration,
      );
}
