part of 'widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
        style: AppTextStyle.medium(fontSize: 16.sp),
      ),
      body: SizedBox(
        height: 360.h,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
            child: Container(
              height: 120.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: AppColors.grey93,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6.r,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.w, 15.h, 0, 15.h),
                child: Row(
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Nike Air Zoom Tempo',
                                  style: AppTextStyle.bold(
                                    fontSize: 15.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconic.cross_small,
                                  size: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                '150',
                                style: AppTextStyle.bold(
                                  fontSize: 15.sp,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.blue_ocean,
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          AppIcons.minus4,
                                          size: 25.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 18.r,
                                        backgroundColor: AppColors.white,
                                        child: Text(
                                          '1',
                                          style: AppTextStyle.semiBold(
                                            fontSize: 17.sp,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          AppIcons.add4,
                                          size: 25.sp,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          itemCount: 4,
        ),
      ),
      bottomSheet: Container(
        height: 270.h,
        width: double.infinity,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              Container(
                height: 150.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.grey93,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total item 3',
                          style: AppTextStyle.medium(
                            fontSize: 15.sp,
                            color: AppColors.dark_grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '800.2',
                          style: AppTextStyle.semiBold(
                            fontSize: 16.sp,
                            color: AppColors.dark_grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Text(
                          'Total item 3',
                          style: AppTextStyle.medium(
                            fontSize: 15.sp,
                            color: AppColors.dark_grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '800.2',
                          style: AppTextStyle.semiBold(
                            fontSize: 16.sp,
                            color: AppColors.dark_grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: const LineSeparate(
                        width: 280,
                        color: AppColors.grey93,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total Price',
                          style: AppTextStyle.medium(
                            fontSize: 15.sp,
                            color: AppColors.dark_grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '800.2',
                          style: AppTextStyle.semiBold(
                            fontSize: 16.sp,
                            color: AppColors.blue_ocean,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const CheckoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
