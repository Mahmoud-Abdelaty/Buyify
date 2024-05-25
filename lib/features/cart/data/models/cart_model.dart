class CartResponse {
  bool status;
  dynamic message;
  CartData data;

  CartResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory CartResponse.fromMap(Map<String, dynamic> json) => CartResponse(
        status: json["status"],
        message: json["message"],
        data: CartData.fromMap(json["data"]),
      );
}

class CartData {
  List<CartItem> cartItems;
  int subTotal;
  int total;

  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartData.fromMap(Map<String, dynamic> json) => CartData(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromMap(x))),
        subTotal: json["sub_total"],
        total: json["total"],
      );
}

class CartItem {
  int id;
  int quantity;
  Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromMap(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        quantity: json["quantity"],
        product: Product.fromMap(json["product"]),
      );
}

class Product {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  Product({
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

  factory Product.fromMap(Map<String, dynamic> json) => Product(
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
