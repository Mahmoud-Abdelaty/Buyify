part of 'widgets.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductAddedToCartSuccess) {
          showSnackBar(
            context: context,
            title: state.data.status ? 'Success' : 'Failed',
            message: state.data.status
                ? '${state.data.message} Chart'
                : state.data.message,
            contentType:
                state.data.status ? ContentType.success : ContentType.warning,
          );
        } else if (state is ProductAddedToCartFailed) {
          showSnackBar(
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

          child: state is ProductAddedToCartLoading
              ? const UpDownLoaderWidget()
              : Text(
                  BlocProvider.of<ProductDetailsBloc>(context)
                              .inCart[productId] ==
                          null
                      ? 'Add To Cart'
                      : BlocProvider.of<ProductDetailsBloc>(context)
                              .inCart[productId]!
                          ? 'Remove From Cart'
                          : 'Add to Cart',
                  style: AppTextStyle.medium(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),

        );
      },
    );
  }
}
