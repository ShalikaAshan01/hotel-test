import 'package:elegant/extentions/extensions.dart';

class HotelResult {
  int? status;
  List<HotelData>? data;

  HotelResult({this.status, this.data});

  HotelResult.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString().parseDouble().toInt();
    if (json['data'] != null) {
      data = <HotelData>[];
      json['data'].forEach((v) {
        data!.add(HotelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelData {
  int? id;
  String? title;
  String? description;
  String? address;
  String? postcode;
  String? phoneNumber;
  double? latitude;
  double? longitude;
  HotelImage? image;

  HotelData(
      {this.id,
        this.title,
        this.description,
        this.address,
        this.postcode,
        this.phoneNumber,
        this.latitude,
        this.longitude,
        this.image});

  HotelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString().parseDouble().toInt();
    title = json['title'];
    description = json['description'];
    address = json['address'];
    postcode = json['postcode'];
    phoneNumber = json['phoneNumber'];
    latitude = json['latitude']?.toString().parseDouble();
    longitude = json['longitude']?.toString().parseDouble();
    image = json['image'] != null ? HotelImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['postcode'] = postcode;
    data['phoneNumber'] = phoneNumber;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class HotelImage {
  String? small;
  String? medium;
  String? large;

  HotelImage({this.small, this.medium, this.large});

  HotelImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['medium'] = medium;
    data['large'] = large;
    return data;
  }
}
