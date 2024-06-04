part of 'widgets/widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductDetailsBloc>(
          create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement())
            ..add(GetProductDetails(productId)),
        ),
        BlocProvider<HomeBloc>(
          create: (context) =>
              HomeBloc(HomeRepoImplement())..add(GetHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Detail Product',
          style: AppTextStyle.medium(fontSize: 16.sp),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartView())),
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
              return BlocBuilder<HomeBloc, HomeState>(
                builder: (context, homeState) {
                  if (homeState is HomeSuccess) {
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
                            ProductSection(
                              productList: homeState.data.products,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const LoadingState();
                  }
                },
              );
            } else if (state is ProductDetailsLoading) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
        floatingActionButton: ActionButtons(productId: productId),
      ),
    );
  }
}
