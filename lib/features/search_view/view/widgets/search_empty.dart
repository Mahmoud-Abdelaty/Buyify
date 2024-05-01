part of 'widgets.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 325.w,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🤔',
              style: AppTextStyle.thin(
                fontSize: 50.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              child: Text(
                'There are No Suitable Products',
                style: AppTextStyle.medium(
                  color: AppColors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Text(
              'Please try using other keywords to find the product name',
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(
                fontSize: 14.sp,
                color: AppColors.half_grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
