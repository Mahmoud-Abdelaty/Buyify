part of 'widgets.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.color,
    required this.title,
    this.icon,
  });

  final Color color;
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 153.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: icon == null ? 25.w : 0),
            child: Text(
              title,
              style: AppTextStyle.medium(
                fontSize: 14.sp,
                color: AppColors.white,
              ),
            ),
          ),
          Icon(
            icon,
            color: AppColors.white,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
