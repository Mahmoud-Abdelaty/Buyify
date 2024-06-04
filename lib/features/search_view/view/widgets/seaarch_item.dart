part of 'widgets.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.model});

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.w,
            height: 90.h,
            child: CachedNetworkImage(
              imageUrl: model.image,
              errorWidget: (context, url, error) => Icon(
                Iconic.exclamation_bold,
                size: 60.sp,
                color: AppColors.dark_red,
              ),
            ),
          ),
          SizedBox(
            width: 220.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: AppTextStyle.semiBold(
                    fontSize: 15.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  model.price.toString(),
                  style: AppTextStyle.medium(
                    fontSize: 13.sp,
                    color: AppColors.red_velvet,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
