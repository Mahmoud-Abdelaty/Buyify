part of 'widgets/widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
        ..add(GetProductDetails(productId)),
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ImagesSlider(imagesList: state.model.images),
                    ProductMainData(model: state.model),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 25.w),
                      child: const LineSeparate(),
                    ),
                  ],
                ),
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
