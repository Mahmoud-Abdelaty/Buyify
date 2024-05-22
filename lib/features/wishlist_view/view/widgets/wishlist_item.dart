part of 'widgets.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({super.key, required this.model});

  final WishlistProductModel model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
        ..add(GetProductsEvent()),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: SizedBox(
                  height: 100.h,
                  width: 100.w,
                  child: CachedNetworkImage(
                    imageUrl: model.product.image,
                    errorWidget: (context, url, error) => Icon(
                      Iconic.exclamation_bold,
                      size: 60.sp,
                      color: AppColors.dark_red,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 230.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      model.product.name,
                      maxLines: 4,
                      style: AppTextStyle.semiBold(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          model.product.price.toString(),
                          style: AppTextStyle.semiBold(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.red_velvet,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () =>
                              BlocProvider.of<ProductDetailsBloc>(context)
                                  .add(AddProductFav(model.product.id)),
                          icon: Icon(
                            Iconic.heart,
                            size: 17.sp,
                            color: AppColors.red_velvet,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
