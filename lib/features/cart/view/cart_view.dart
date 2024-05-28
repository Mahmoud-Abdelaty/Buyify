part of 'widgets/widgets.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartBloc(CartRepoImplement())..add(GetCartDateEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Cart',
          style: AppTextStyle.medium(fontSize: 16.sp),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartSuccessState) {
              return SizedBox(
                height: 360.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  itemBuilder: (context, index) =>
                      CartItem(cartItem: state.data.cartItems[index]),
                  itemCount: state.data.cartItems.length,
                ),
              );
            } else if (state is CartLoadingState) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
        bottomSheet: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartSuccessState) {
              return CheckoutCorner(data: state.data);
            } else if (state is CartLoadingState) {
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
