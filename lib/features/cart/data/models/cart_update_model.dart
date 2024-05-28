class ProductUpdateModel {
  Null id;
  Null price;
  Null oldPrice;
  Null discount;
  Null image;

  ProductUpdateModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ProductUpdateModel.fromMap(Map<String, dynamic> json) =>
      ProductUpdateModel(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
      );
}
