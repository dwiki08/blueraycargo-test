import 'package:json_annotation/json_annotation.dart';

part 'post_address_request.g.dart';

@JsonSerializable()
class PostAddressRequest {
  String? address;
  @JsonKey(name: "address_label")
  String? label;
  String? name;
  @JsonKey(name: "phone_number")
  String? phoneNumber;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "province_id")
  int? provinceId;
  @JsonKey(name: "district_id")
  int? districtId;
  @JsonKey(name: "sub_district_id")
  int? subDistrictId;
  @JsonKey(name: "postal_code")
  String? postalCode;
  double? long;
  double? lat;
  @JsonKey(name: "address_map")
  String? addressMap;
  String? npwp;
  @JsonKey(name: "npwp_file")
  String? npwpFile;

  PostAddressRequest({
    this.address,
    this.label,
    this.name,
    this.phoneNumber,
    this.email,
    this.provinceId,
    this.districtId,
    this.subDistrictId,
    this.postalCode,
    this.long,
    this.lat,
    this.addressMap,
    this.npwp,
    this.npwpFile,
  });

  factory PostAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$PostAddressRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostAddressRequestToJson(this);
}
