part of 'widgets/widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
            ..add(GetProductDetails(productId)),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(HomeRepoImplement())..add(GetHomeDataEvent()),
        ),
      ],
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 25.h, 0.w, 80.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImagesSlider(imagesList: state.model.images),
                      SizedBox(height: 25.h),
                      ProductMainData(model: state.model),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 25.w),
                        child: const LineSeparate(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description Product',
                              style: AppTextStyle.bold(
                                fontSize: 16.sp,
                                color: AppColors.dark_blue,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              state.model.description,
                              style: AppTextStyle.medium(
                                fontSize: 14.sp,
                                color: AppColors.red_velvet,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeSuccess) {
                            return ProductSection(
                                productList: state.data.products);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProductDetailsLoading) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomButtons(
                color: AppColors.dark_red,
                title: 'Added',
                icon: Iconic.heart_solid,
              ),
              SizedBox(width: 19.w),
              const CustomButtons(
                color: AppColors.blue_ocean,
                title: 'Add to Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
