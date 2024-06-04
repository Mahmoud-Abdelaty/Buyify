class FavoritesModel {
  final bool status;
  final String message;

  FavoritesModel({required this.status, required this.message});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
