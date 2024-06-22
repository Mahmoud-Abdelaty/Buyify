part of 'widgets.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBox(),
          Container(
            height: 150.h,
            width: 305.w,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.alabaster,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey93,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 92.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey93,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Column(
              children: [
                const TitleSections(
                  title: 'Categories',
                ),
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => SizedBox(
                      child: Column(
                        children: [
                          Container(
                            width: 70.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: AppColors.grey93,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 10.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.grey93,
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 32.w),
                    itemCount: 4,
                  ),
                ),
                TitleSections(
                  title: 'Featured Product',
                ),
                SizedBox(
                  height: 245.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      width: 156.w,
                      decoration: BoxDecoration(
                        color: AppColors.alabaster,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(10.w, 15.h, 16.w, 20.h),
                            child: Center(
                              child: Container(
                                width: 136.w,
                                height: 125.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.grey93,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.grey93,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  width: 100.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.grey93,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 20.w),
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.h,
            width: 327.w,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.alabaster,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w, top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey93,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 92.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey93,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
