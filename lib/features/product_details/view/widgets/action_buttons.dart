part of 'widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtons(
            color: AppColors.dark_red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Added',
                  style: AppTextStyle.medium(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
                Icon(
                  Iconic.heart_solid,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ],
            ),
          ),
          SizedBox(width: 19.w),
          CustomButtons(
            color: AppColors.blue_ocean,
            child: Center(
              child: Text(
                'Add to Cart',
                style: AppTextStyle.medium(
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
