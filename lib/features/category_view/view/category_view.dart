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
        appBar: CustomAppBar(title: 'Category'),
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
                      // SearchBox(
                      //   enabled: true,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       list = state.data
                      //           .where((product) => product.name
                      //               .toLowerCase()
                      //               .contains(value.toLowerCase()))
                      //           .toList();
                      //     });
                      //   },
                      // ),
                      // if (list.isNotEmpty)
                      //   SizedBox(
                      //       height: 200.h,
                      //       child: SearchBoxResult(productModel: list)),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.off_grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                topLeft: Radius.circular(10.r))),
                        padding: EdgeInsets.symmetric(vertical: 25.h),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 13.w,
                            mainAxisSpacing: 21.h,
                            mainAxisExtent: 245.h,
                          ),
                          itemCount: state.data.length,
                          itemBuilder: (context, index) {
                            return ItemBox(productModel: state.data[index]);
                          },
                        ),
                      ),
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
        floatingActionButton: CustomButtons(
          color: Colors.white,
          width: 300.w,
          border: Border.all(color: Colors.black),
          child: Center(
              child: Text(
            'Filter & Sorting',
            style: AppTextStyle.medium(
              fontSize: 14.sp,
            ),
          )),
        ),
      ),
    );
  }
}
