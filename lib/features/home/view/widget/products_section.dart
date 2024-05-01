part of 'widgets.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSections(
          title: 'Featured Product',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeaturedProduct(productsList: productList),
            ),
          ),
        ),
        SizedBox(
          height: 245.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                ItemBox(productModel: productList[index]),
            separatorBuilder: (context, index) => SizedBox(width: 20.w),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
