import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtons extends StatefulWidget {
  CustomButtons({
    super.key,
    required this.color,
    required this.child,
    this.width = 160,
    this.height = 60,
    this.border,
    this.onTap,
  });

  final Color color;
  final Widget child;
  final double width;
  final double height;
  final BoxBorder? border;
  Function()? onTap;
  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        width: isTapped ? widget.width.w - 10.w : widget.width.w,
        height: isTapped ? widget.height.w - 10.h : widget.height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: widget.border,
          color: widget.color,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5.r,
              offset: const Offset(3, 7),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 200),
        child: Center(child: widget.child),
      ),
    );
  }
}
