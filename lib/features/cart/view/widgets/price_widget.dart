part of 'widgets.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.medium(
              fontSize: 15.sp,
              color: AppColors.dark_grey,
            ),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
