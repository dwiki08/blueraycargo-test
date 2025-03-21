// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) =>
    GeneralResponse(
      action: json['action'] as bool?,
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GeneralResponseToJson(GeneralResponse instance) =>
    <String, dynamic>{
      'action': instance.action,
      'message': instance.message,
      'status': instance.status,
    };
