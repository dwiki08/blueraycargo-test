import 'package:json_annotation/json_annotation.dart';

part 'sub_district_response.g.dart';

@JsonSerializable()
class SubDistrictResponse {
  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "province")
  String? province;

  @JsonKey(name: "district")
  String? district;

  @JsonKey(name: "sub_district")
  String? subDistrict;

  @JsonKey(name: "sub_district_code")
  String? subDistrictCode;

  @JsonKey(name: "province_id")
  int? provinceId;

  @JsonKey(name: "district_id")
  int? districtId;

  @JsonKey(name: "sub_district_id")
  int? subDistrictId;

  SubDistrictResponse({
    this.address,
    this.province,
    this.district,
    this.subDistrict,
    this.subDistrictCode,
    this.provinceId,
    this.districtId,
    this.subDistrictId,
  });

  factory SubDistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$SubDistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubDistrictResponseToJson(this);
}
