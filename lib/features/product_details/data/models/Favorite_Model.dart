import 'package:Buyify/features/home/data/models/home_model.dart';

class FavoriteModel {
  final bool status;
  final String message;
  final List<Data>? data;

  FavoriteModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json.containsKey('data') ? Data.fromJson(json['data']) : [],
    );
  }
}

class Data {
  final int id;
  final ProductModel? product;

  Data({
    required this.id,
    this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] ?? 0,
      product: json.containsKey('product') && json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
    );
  }
}
