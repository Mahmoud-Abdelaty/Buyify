class AddressModel {
  final bool status;
  final String message;

  AddressModel({required this.status, required this.message});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
