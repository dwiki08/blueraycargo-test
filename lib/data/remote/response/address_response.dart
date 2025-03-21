import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "address_id")
  int? addressId;
  @JsonKey(name: "province_id")
  int? provinceId;
  @JsonKey(name: "province_name")
  String? provinceName;
  @JsonKey(name: "district_id")
  int? districtId;
  @JsonKey(name: "district_name")
  String? districtName;
  @JsonKey(name: "sub_district_id")
  int? subDistrictId;
  @JsonKey(name: "sub_district_name")
  String? subDistrictName;
  @JsonKey(name: "city_code")
  String? cityCode;
  @JsonKey(name: "npwp_file")
  String? npwpFile;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "deleted_at")
  String? deletedAt;
  String? service;
  @JsonKey(name: "address_type")
  String? addressType;
  @JsonKey(name: "address_label")
  String? addressLabel;
  String? name;
  @JsonKey(name: "country_name")
  String? countryName;
  String? address;
  @JsonKey(name: "postal_code")
  String? postalCode;
  double? long;
  double? lat;
  @JsonKey(name: "address_map")
  String? addressMap;
  String? email;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "phone_number_2")
  String? phoneNumber2;
  String? npwp;
  @JsonKey(name: "is_primary")
  bool? isPrimary;
  String? note;
  int? customer;
  int? province;
  int? district;
  @JsonKey(name: "sub_district")
  int? subDistrict;
  int? country;

  AddressResponse({
    this.addressId,
    this.provinceId,
    this.provinceName,
    this.districtId,
    this.districtName,
    this.subDistrictId,
    this.subDistrictName,
    this.cityCode,
    this.npwpFile,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.service,
    this.addressType,
    this.addressLabel,
    this.name,
    this.countryName,
    this.address,
    this.postalCode,
    this.long,
    this.lat,
    this.addressMap,
    this.email,
    this.phoneNumber,
    this.phoneNumber2,
    this.npwp,
    this.isPrimary,
    this.note,
    this.customer,
    this.province,
    this.district,
    this.subDistrict,
    this.country,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}
