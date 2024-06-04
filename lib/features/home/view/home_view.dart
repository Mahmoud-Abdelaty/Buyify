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
          preferredSize: Size.fromHeight(66.h),
          child: const HomeAppBar(),
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
                        color: AppColors.alabaster,
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
              return const LoadingState();
            } else {
              return HomeLoading();
            }
          },
        ),
      ),
    );
  }
}
