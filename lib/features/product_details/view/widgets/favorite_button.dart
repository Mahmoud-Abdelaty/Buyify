part of 'widgets.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductAddedFavSuccess) {
          showSnackBar(
            context: context,
            title: state.data.status ? 'Success' : 'Failed',
            message: state.data.status
                ? '${state.data.message} Favorite'
                : state.data.message,
            contentType:
                state.data.status ? ContentType.success : ContentType.warning,
          );
        } else if (state is ProductAddedFavFailed) {
          showSnackBar(
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
                BlocProvider.of<ProductDetailsBloc>(context)
                            .inFavorites[productId] ==
                        null
                    ? 'Added'
                    : BlocProvider.of<ProductDetailsBloc>(context)
                            .inFavorites[productId]!
                        ? 'Remove'
                        : 'Added',
                style: AppTextStyle.medium(
                  fontSize: 14.sp,
                  color: AppColors.white,
                ),
              ),
              state is ProductAddedFavLoading
                  ? const UpDownLoaderWidget()
                  : Icon(
                      Iconic.heart_solid,
                      color: AppColors.white,
                      size: 20.sp,
                    ),
            ],
          ),
        );
      },
    );
  }
}
