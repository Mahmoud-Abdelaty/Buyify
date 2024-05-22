part of 'widgets/widgets.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WishlistBloc(WishlistRepoImplement())
            ..add(GetWishlistProductsEvent()),
        ),
        BlocProvider(
          create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
            ..add(GetProductsEvent()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Wishlist',
          leadingButton: false,
          style: AppTextStyle.medium(fontSize: 16.sp),
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, productState) {
            if (productState is GetProductsSuccess) {
              return BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  if (state is GetWishlistProductsSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      itemBuilder: (context, index) => WishlistItem(
                        model: state.data[index],
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemCount: state.data.length,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            } else if (productState is GetProductsLoading) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
      ),
    );
  }
}
