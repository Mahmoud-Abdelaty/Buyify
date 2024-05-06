part of 'widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key, required this.productId, required this.inFavorite});

  final int productId;
  final bool inFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement()),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductAddedFavSuccess) {
                  _showSnackBar(
                    context: context,
                    title: state.data.status ? 'Success' : 'Failed',
                    message: state.data.status
                        ? '${state.data.message} Favorite'
                        : state.data.message,
                    contentType: state.data.status
                        ? ContentType.success
                        : ContentType.warning,
                  );
                } else if (state is ProductAddedFavFailed) {
                  _showSnackBar(
                    context: context,
                    title: 'Not Done',
                    message: 'Not Done',
                    contentType: ContentType.failure,
                  );
                }
                return CustomButtons(
                  color: AppColors.dark_red,
                  onTap: () => BlocProvider.of<ProductDetailsBloc>(context)
                      .add(AddProductFav(productId)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Added',
                        style: AppTextStyle.medium(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      state is ProductAddedFavLoading
                          ? const UpDownLoader(
                              size: 4,
                              duration: Duration(milliseconds: 200),
                              firstColor: Colors.white,
                            )
                          : Icon(
                              Iconic.heart_solid,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 19.w),
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductAddedToCartSuccess) {
                  _showSnackBar(
                    context: context,
                    title: state.data.status ? 'Success' : 'Failed',
                    message: state.data.status
                        ? '${state.data.message} Chart'
                        : state.data.message,
                    contentType: state.data.status
                        ? ContentType.success
                        : ContentType.warning,
                  );
                } else if (state is ProductAddedToCartFailed) {
                  _showSnackBar(
                    context: context,
                    title: 'Failed',
                    message: 'Check Your Network',
                    contentType: ContentType.failure,
                  );
                }
                return CustomButtons(
                  onTap: () => BlocProvider.of<ProductDetailsBloc>(context)
                      .add(AddProductToCart(productId)),
                  color: AppColors.blue_ocean,
                  child: Center(
                    child: state is ProductAddedToCartLoading
                        ? const UpDownLoader(
                            size: 4,
                            duration: Duration(milliseconds: 200),
                            firstColor: Colors.white,
                          )
                        : Text(
                            'Add to Cart',
                            style: AppTextStyle.medium(
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: title,
            message: message,
            contentType: contentType,
            messageFontSize: 14.sp,
            titleFontSize: 18.sp,
          ),
        ),
      );
    });
  }
}
