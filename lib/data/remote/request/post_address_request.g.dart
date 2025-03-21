// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAddressRequest _$PostAddressRequestFromJson(Map<String, dynamic> json) =>
    PostAddressRequest(
      address: json['address'] as String?,
      label: json['address_label'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      provinceId: (json['province_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      subDistrictId: (json['sub_district_id'] as num?)?.toInt(),
      postalCode: json['postal_code'] as String?,
      long: (json['long'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
      addressMap: json['address_map'] as String?,
      npwp: json['npwp'] as String?,
      npwpFile: json['npwp_file'] as String?,
    );

Map<String, dynamic> _$PostAddressRequestToJson(PostAddressRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_label': instance.label,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'sub_district_id': instance.subDistrictId,
      'postal_code': instance.postalCode,
      'long': instance.long,
      'lat': instance.lat,
      'address_map': instance.addressMap,
      'npwp': instance.npwp,
      'npwp_file': instance.npwpFile,
    };
