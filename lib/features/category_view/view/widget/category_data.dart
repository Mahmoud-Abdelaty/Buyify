part of 'widgets.dart';

class CategoryDataWidget extends StatelessWidget {
  const CategoryDataWidget({super.key, required this.listProducts});
  final List<ProductModel> listProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.alabaster,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))),
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
        itemCount: listProducts.length,
        itemBuilder: (context, index) {
          return ItemBox(productModel: listProducts[index]);
        },
      ),
    );
  }
}
