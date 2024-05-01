part of 'widget/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(HomeRepoImplement())..add(GetHomeDataEvent()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                scrolledUnderElevation: 0,
                title: Text(
                  'Buyify',
                  style: AppTextStyle.bold(
                    fontSize: 18.sp,
                    color: AppColors.blue_ocean,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconic.bell_bold,
                      size: 20.sp,
                    ),
                  ),
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
              const LineSeparate(),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBox(),
                    Banners(list: state.data.banners),
                    const CategorySection(),
                    SizedBox(height: 5.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.off_grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          ProductSection(productList: state.data.products),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 36.h),
                            child: ImageBox(imageUrl: state.data.ad),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.blue_ocean,
              ));
            } else {
              return const ErrorState();
            }
          },
        ),
      ),
    );
  }
}
