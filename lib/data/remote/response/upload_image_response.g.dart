// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      action: json['action'] as bool?,
      message: json['message'] as String?,
      imageUrl: json['image_url'] as String?,
      contentLength: (json['content_length'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadImageResponseToJson(
  UploadImageResponse instance,
) => <String, dynamic>{
  'action': instance.action,
  'message': instance.message,
  'image_url': instance.imageUrl,
  'content_length': instance.contentLength,
};
