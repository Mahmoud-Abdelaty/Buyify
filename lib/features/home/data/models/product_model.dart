part of 'home_model.dart';

class ProductModel {
  final int id;
  final num price;
  final num oldPrice;
  final num discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imageList = json['images'] ?? [];

    return ProductModel(
      id: json['id'] ?? 0,
      price: json['price'] ?? 0,
      oldPrice: json['old_price'] ?? 0,
      discount: json['discount'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: imageList.map((item) => item.toString()).toList(),
      inFavorites: json['in_favorites'] ?? false,
      inCart: json['in_cart'] ?? false,
    );
  }
}
