import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons({
    super.key,
    required this.color,
    required this.child,
    this.width = 153,
    this.height = 50,
  });

  final Color color;
  final Widget child;
  final double width;
  final double height;

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged: (value) {
        setState(() {
          isTapped = value;
        });
      },
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        width: isTapped ? widget.width.w - 1.w : widget.width.w,
        height: isTapped ? widget.height.w - 1.h : widget.height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
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
        child: widget.child,
      ),
    );
  }
}
