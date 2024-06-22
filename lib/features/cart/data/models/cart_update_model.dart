class ProductModelOP {
  Null id;
  Null price;
  Null oldPrice;
  Null discount;
  Null image;

  ProductModelOP({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ProductModelOP.fromMap(Map<String, dynamic> json) => ProductModelOP(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
      );
}
