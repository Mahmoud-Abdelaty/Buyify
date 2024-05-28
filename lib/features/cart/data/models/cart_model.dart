class CartDataModel {
  List<CartItemModel> cartItems;
  num subTotal;
  num total;

  CartDataModel({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartDataModel.fromMap(Map<String, dynamic> json) => CartDataModel(
        cartItems: List<CartItemModel>.from(
            json["cart_items"].map((x) => CartItemModel.fromMap(x))),
        subTotal: json["sub_total"],
        total: json["total"],
      );
}

class CartItemModel {
  num id;
  num quantity;
  ProductModel product;

  CartItemModel({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItemModel.fromMap(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        quantity: json["quantity"],
        product: ProductModel.fromMap(json["product"]),
      );
}

class ProductModel {
  num id;
  num price;
  num oldPrice;
  num discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

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

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
      );
}
