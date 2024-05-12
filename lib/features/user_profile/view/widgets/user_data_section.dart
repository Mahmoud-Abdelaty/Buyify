part of 'widgets.dart';

class UserDataSection extends StatelessWidget {
  UserDataSection({
    super.key,
    required this.title,
    this.data,
    required this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
  });

  final String title;
  final dynamic data;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.semiBold(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 323.w,
            height: 52.h,
            child: TextField(
              decoration: InputDecoration(
                labelText: data,
                labelStyle: AppTextStyle.medium(fontSize: 14.sp),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(
                    color: AppColors.dark_grey,
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Icon(
                    prefixIcon,
                    size: 18.sp,
                    color: AppColors.dark_grey,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    suffixIcon,
                    size: 18.sp,
                  ),
                ),
              ),
              enabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
