part of 'widgets.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey,
      highlightColor: Colors.white,
      child: Column(
        children: [
          SearchBox(),
          Container(
            height: 115.h,
            width: 315.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.cyan,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.w),
            child: Column(
              children: [
                const TitleSections(
                  title: 'Categories',
                ),
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      child: Column(
                        children: [
                          Container(
                            width: 70.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 32.w),
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          // Container(
          //   decoration: BoxDecoration(
          //     color: AppColors.alabaster,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(10.r),
          //       topRight: Radius.circular(10.r),
          //     ),
          //   ),
          //   child: Column(
          //     children: [
          //       ProductSection(productList: state.data.products),
          //       Padding(
          //         padding: EdgeInsets.symmetric(vertical: 36.h),
          //         child: ImageBox(imageUrl: state.data.ad),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

// return SingleChildScrollView(
//   child: Column(
//     children: [
//       SearchBox(),
//       Banners(list: state.data.banners),
//       const CategorySection(),
//       SizedBox(height: 5.h),
//       Container(
//         decoration: BoxDecoration(
//           color: AppColors.alabaster,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.r),
//             topRight: Radius.circular(10.r),
//           ),
//         ),
//         child: Column(
//           children: [
//             ProductSection(productList: state.data.products),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 36.h),
//               child: ImageBox(imageUrl: state.data.ad),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// );
