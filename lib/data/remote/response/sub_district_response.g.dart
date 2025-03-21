// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubDistrictResponse _$SubDistrictResponseFromJson(Map<String, dynamic> json) =>
    SubDistrictResponse(
      address: json['address'] as String?,
      province: json['province'] as String?,
      district: json['district'] as String?,
      subDistrict: json['sub_district'] as String?,
      subDistrictCode: json['sub_district_code'] as String?,
      provinceId: (json['province_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      subDistrictId: (json['sub_district_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubDistrictResponseToJson(
  SubDistrictResponse instance,
) => <String, dynamic>{
  'address': instance.address,
  'province': instance.province,
  'district': instance.district,
  'sub_district': instance.subDistrict,
  'sub_district_code': instance.subDistrictCode,
  'province_id': instance.provinceId,
  'district_id': instance.districtId,
  'sub_district_id': instance.subDistrictId,
};
