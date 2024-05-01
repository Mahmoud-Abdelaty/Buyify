part of 'widgets/widgets.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({super.key, required this.productsList});

  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Featured Product'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBox(enabled: true),
            Container(
              decoration: BoxDecoration(
                color: AppColors.off_grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 25.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.w,
                  mainAxisSpacing: 21.h,
                  mainAxisExtent: 245.h,
                ),
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return ItemBox(productModel: productsList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
