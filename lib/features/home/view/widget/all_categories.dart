part of '../../../category_view/view/widget/widgets.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key, required this.categoriesList});

  final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 10.h),
              child: Row(
                children: [
                  Text(
                    'All Categories',
                    style: AppTextStyle.bold(
                      fontSize: 16.sp,
                      color: AppColors.dark_blue,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Iconic.cross_small,
                        size: 13.sp,
                        color: AppColors.dark_blue,
                      ))
                ],
              ),
            ),
            const LineSeparate(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  mainAxisExtent: 85.h,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryView(
                            id: categoriesList[index].id,
                            title:
                                convertToPascalCase(categoriesList[index].name),
                          ),
                        )),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: categoriesList[index].image,
                          width: 50.w,
                          height: 50.h,
                          errorWidget: (context, url, error) => Icon(
                            Iconic.exclamation_bold,
                            size: 60.sp,
                            color: AppColors.dark_red,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          convertToPascalCase(
                            categoriesList[index].name,
                          ),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.regular(
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
