part of 'widgets.dart';

class ProductMainData extends StatelessWidget {
  const ProductMainData({super.key, required this.model});

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.name,
            style: AppTextStyle.semiBold(
              fontSize: 15.sp,
              // overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(
                model.price.toString(),
                style: AppTextStyle.bold(
                  fontSize: 12.sp,
                  color: AppColors.red_velvet,
                ),
              ),
              SizedBox(width: 15.w),
              if (model.discount != 0)
                Text(
                  model.oldPrice.toString(),
                  style: AppTextStyle.bold(
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              const Spacer(),
              model.discount != 0
                  ? Container(
                      height: 30.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                        color: AppColors.rating_color,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Text(
                          '${model.discount}% OFF',
                          style: AppTextStyle.bold(
                            fontSize: 11.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 30.h),
            ],
          ),
        ],
      ),
    );
  }
}
