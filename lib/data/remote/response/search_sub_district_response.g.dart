// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_sub_district_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSubDistrictResponse _$SearchSubDistrictResponseFromJson(
  Map<String, dynamic> json,
) => SearchSubDistrictResponse(
  action: json['action'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SubDistrictResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SearchSubDistrictResponseToJson(
  SearchSubDistrictResponse instance,
) => <String, dynamic>{
  'action': instance.action,
  'message': instance.message,
  'data': instance.data,
};
