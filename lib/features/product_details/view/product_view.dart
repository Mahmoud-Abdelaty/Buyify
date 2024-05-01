part of 'widgets/widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Detail Product',
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Iconic.shopping_cart_bold,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsSuccess) {
              return Column(
                children: [
                  Container(),
                ],
              );
            } else if (state is ProductDetailsLoading) {
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
