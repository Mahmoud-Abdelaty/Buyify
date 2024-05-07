class ProductFavModel {
  int id;
  Product product;

  ProductFavModel({required this.id, required this.product});

  factory ProductFavModel.fromJson(Map<String, dynamic> json) {
    return ProductFavModel(
      id: json['id'],
      product: Product.fromJson(json['product']),
    );
  }
}

class Product {
  int id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
