part of 'widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
        ..add(GetProductsEvent()),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, favoriteState) {
          return Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FavoriteButton(productId: productId),
                SizedBox(width: 19.w),
                AddCartButton(productId: productId),
              ],
            ),
          );
        },
      ),
    );
  }
}
