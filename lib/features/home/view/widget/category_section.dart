part of 'widgets.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(HomeRepoImplement())..add(GetCategoryDataEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CategorySuccess) {
            return Column(
              children: [
                TitleSections(
                  title: 'Categories',
                  onPressed: () => showGeneralDialog(
                    barrierLabel: "Product Action",
                    barrierDismissible: true,
                    transitionDuration: const Duration(milliseconds: 700),
                    context: context,
                    pageBuilder: (context, anim1, anim2) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r)),
                            margin: EdgeInsets.only(
                                bottom: 20.h, left: 20.w, right: 20.w),
                            child: AllCategories(categoriesList: state.data)),
                      );
                    },
                    transitionBuilder: (context, anim1, anim2, child) {
                      return SlideTransition(
                        position: Tween(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0))
                            .animate(anim1),
                        child: child,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryView(
                              id: state.data[index].id,
                              title:
                                  convertToPascalCase(state.data[index].name),
                            ),
                          )),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Container(
                              width: 70.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: state.data[index].image,
                                errorWidget: (context, url, error) => Icon(
                                  Iconic.exclamation_bold,
                                  size: 60.sp,
                                  color: AppColors.dark_red,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              convertAndSplitToPascalCase(
                                  state.data[index].name),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 32.w),
                    itemCount: 4,
                  ),
                ),
              ],
            );
          } else if (state is CategoryLoading) {
            return const SizedBox.shrink();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
