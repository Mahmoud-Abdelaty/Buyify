part of '../../widgets.dart';

class DataBox extends StatelessWidget {
  const DataBox({super.key, required this.title, required this.data});

  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Row(
        children: [
          Icon(
            Iconic.envelope,
            size: 23.sp,
            color: AppColors.blue_ocean,
          ),
          SizedBox(width: 25.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.regular(
                  fontSize: 15.sp,
                ),
              ),
              Text(
                data,
                style: AppTextStyle.regular(
                  fontSize: 15.sp,
                  color: AppColors.half_grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
