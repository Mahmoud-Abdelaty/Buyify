class AddressDataModel {
  List<AddressDetailsModel> addresses;

  AddressDataModel({
    required this.addresses,
  });

  factory AddressDataModel.fromJson(Map<String, dynamic> json) {
    return AddressDataModel(
      addresses: List<AddressDetailsModel>.from(
          json['data'].map((x) => AddressDetailsModel.fromJson(x))),
    );
  }
}

class AddressDetailsModel {
  int id;
  String name;
  String city;
  String region;
  String details;
  String notes;
  double latitude;
  double longitude;

  AddressDetailsModel({
    required this.id,
    required this.name,
    required this.city,
    required this.region,
    required this.details,
    required this.notes,
    required this.latitude,
    required this.longitude,
  });

  factory AddressDetailsModel.fromJson(Map<String, dynamic> json) {
    return AddressDetailsModel(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      region: json['region'],
      details: json['details'],
      notes: json['notes'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
