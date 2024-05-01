part of 'widgets.dart';

class SearchBoxResult extends StatelessWidget {
  const SearchBoxResult({
    super.key,
    required this.productModel,
  });

  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 25.h),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r)),
          height: 100.h,
          width: 150.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100.w,
                height: 90.h,
                child: CachedNetworkImage(
                  imageUrl: productModel[index].image,
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
                      productModel[index].name,
                      style: AppTextStyle.semiBold(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      productModel[index].price.toString(),
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
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemCount: productModel.length,
      ),
    );
  }
}
