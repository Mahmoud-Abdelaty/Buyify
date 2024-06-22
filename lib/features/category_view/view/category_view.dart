part of 'widget/widgets.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.id, required this.title})
      : super(key: key);

  final int id;
  final String title;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> list = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(CategoryRepoImplement())
        ..add(GetCategoryData(widget.id)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Category',
          style: AppTextStyle.medium(fontSize: 16.sp),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is GetCategorySuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.w, 30.h, 25.w, 0.h),
                        child: Text(
                          widget.title,
                          style: AppTextStyle.bold(
                            fontSize: 24.sp,
                            color: AppColors.dark_blue,
                          ),
                        ),
                      ),
                      SearchBox(),
                      CategoryDataWidget(listProducts: state.data),
                    ],
                  ),
                ),
              );
            } else if (state is GetCategoryLoading) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
        floatingActionButton: const FilterAndSortingButton(),
      ),
    );
  }
}
