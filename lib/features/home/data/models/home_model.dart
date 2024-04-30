part 'banner_model.dart';
part 'product_model.dart';

class HomeModel {
  final List<BannerModel> banners;
  final List<ProductModel> products;
  final String ad;

  HomeModel({required this.banners, required this.products, required this.ad});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? bannerList = json['banners'];
    List<dynamic>? productList = json['products'];

    return HomeModel(
      banners:
          bannerList?.map((item) => BannerModel.fromJson(item)).toList() ?? [],
      products:
          productList?.map((item) => ProductModel.fromJson(item)).toList() ??
              [],
      ad: json['ad'] ?? '',
    );
  }
}
