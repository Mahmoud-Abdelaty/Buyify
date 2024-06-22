part of 'widgets.dart';

class TitleSections extends StatelessWidget {
  const TitleSections({super.key, required this.title, this.onPressed});

  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.medium(
              fontSize: 16.sp,
              color: AppColors.dark_blue,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'See All',
              style: AppTextStyle.medium(
                fontSize: 12.sp,
                color: AppColors.blue_ocean,
              ),
            ),
          )
        ],
      ),
    );
  }
}
