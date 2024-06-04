part of 'widgets.dart';

class SearchBoxResult extends StatelessWidget {
  const SearchBoxResult({
    super.key,
    required this.productModel,
  });

  final List<ProductModel> productModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 0, 25.w, 25.h),
        itemBuilder: (context, index) => SearchItem(model: productModel[index]),
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemCount: productModel.length,
      ),
    );
  }
}
