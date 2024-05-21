part of 'widgets/widgets.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistBloc(WishlistRepoImplement())
        ..add(GetWishlistProductsEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Wishlist',
          leadingButton: false,
          style: AppTextStyle.medium(fontSize: 16.sp),
        ),
        body: BlocBuilder<WishlistBloc, WishlistState>(
          builder: (context, state) {
            if (state is GetWishlistProductsSuccess) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                itemBuilder: (context, index) =>
                    WishlistItem(model: state.data[index]),
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: state.data.length,
              );
            } else if (state is GetWishlistProductsLoading) {
              return LoadingState();
            } else {
              return ErrorState();
            }
          },
        ),
      ),
    );
  }
}
