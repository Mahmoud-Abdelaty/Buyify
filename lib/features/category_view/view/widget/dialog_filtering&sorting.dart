part of 'widgets.dart';

class DialogFilteringAndSorting extends StatelessWidget {
  const DialogFilteringAndSorting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 545.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 10.h),
              child: Row(
                children: [
                  Text(
                    'Product Action',
                    style: AppTextStyle.bold(
                      fontSize: 16.sp,
                      color: AppColors.dark_blue,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Iconic.cross_small,
                        size: 13.sp,
                        color: AppColors.dark_blue,
                      ))
                ],
              ),
            ),
            const LineSeparate(),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 15.h),
              child: Text(
                'Add to Wishlist',
                style: AppTextStyle.medium(
                  fontSize: 14.sp,
                  color: AppColors.dark_blue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 10.h),
              child: const LineSeparate(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 0.h),
              child: Text(
                'Share Product',
                style: AppTextStyle.medium(
                  fontSize: 14.sp,
                  color: AppColors.dark_blue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: 275.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.blue_ocean,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    'Add To Cart',
                    style: AppTextStyle.medium(
                        fontSize: 14.sp, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
