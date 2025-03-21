import 'package:json_annotation/json_annotation.dart';

part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  @JsonKey(name: "action")
  bool? action;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "image_url")
  String? imageUrl;

  @JsonKey(name: "content_length")
  int? contentLength;

  UploadImageResponse({
    this.action,
    this.message,
    this.imageUrl,
    this.contentLength,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
}
