part of '../../features/home/view/widget/widgets.dart';

class LineSeparate extends StatelessWidget {
  const LineSeparate({
    super.key,
    this.color = AppColors.alabaster,
    this.width = 327,
  });

  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5.h,
      width: width.w,
      color: color,
    );
  }
}
