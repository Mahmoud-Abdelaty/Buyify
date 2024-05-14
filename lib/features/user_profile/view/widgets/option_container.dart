part of 'widgets.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({super.key, required this.type});

  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: AppTextStyle.semiBold(
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            width: 323.w,
            height: 52.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.dark_grey,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}
