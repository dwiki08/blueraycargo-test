// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAddressResponse _$PostAddressResponseFromJson(Map<String, dynamic> json) =>
    PostAddressResponse(
      action: json['action'] as bool?,
      message: json['message'] as String?,
      statusCode: (json['status_code'] as num?)?.toInt(),
      result:
          json['result'] == null
              ? null
              : AddressResponse.fromJson(
                json['result'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$PostAddressResponseToJson(
  PostAddressResponse instance,
) => <String, dynamic>{
  'action': instance.action,
  'message': instance.message,
  'status_code': instance.statusCode,
  'result': instance.result,
};
