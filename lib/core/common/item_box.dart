part of '../../features/home/view/widget/widgets.dart';

class ItemBox extends StatelessWidget {
  const ItemBox({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(productId: productModel.id),
          )),
      child: Container(
        width: 156.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: productModel.discount != 0
                  ? Container(
                      height: 35.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: AppColors.rating_color,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Text(
                          '${productModel.discount}% OFF',
                          style: AppTextStyle.bold(
                            fontSize: 11.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 30.h),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0.h, 16.w, 0.h),
              child: Center(
                child: SizedBox(
                  width: 100.w,
                  height: 100.h,
                  child: CachedNetworkImage(
                    imageUrl: productModel.image,
                    errorWidget: (context, url, error) => Icon(
                      Iconic.exclamation_bold,
                      size: 60.sp,
                      color: AppColors.dark_red,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      productModel.name,
                      style: AppTextStyle.semiBold(
                        fontSize: 14.sp,
                        color: AppColors.dark_blue,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        productModel.price.toString(),
                        style: AppTextStyle.bold(
                          fontSize: 12.sp,
                          color: AppColors.red_velvet,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      if (productModel.discount != 0)
                        Text(
                          productModel.oldPrice.toString(),
                          style: AppTextStyle.bold(
                            fontSize: 12.sp,
                            color: AppColors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showGeneralDialog(
                            barrierLabel: "Product Action",
                            barrierDismissible: true,
                            transitionDuration:
                                const Duration(milliseconds: 700),
                            context: context,
                            pageBuilder: (context, anim1, anim2) {
                              return Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    margin: EdgeInsets.only(
                                        bottom: 20.h, left: 20.w, right: 20.w),
                                    child: const DialogProductAction()),
                              );
                            },
                            transitionBuilder: (context, anim1, anim2, child) {
                              return SlideTransition(
                                position: Tween(
                                        begin: const Offset(0, 1),
                                        end: const Offset(0, 0))
                                    .animate(anim1),
                                child: child,
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Iconic.menu_dots_vertical,
                          size: 12.sp,
                          color: AppColors.half_grey,
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
    );
  }
}
