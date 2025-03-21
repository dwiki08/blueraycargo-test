import 'package:json_annotation/json_annotation.dart';

import 'address_response.dart';

part 'post_address_response.g.dart';

@JsonSerializable()
class PostAddressResponse {
  @JsonKey(name: "action")
  bool? action;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status_code")
  int? statusCode;
  AddressResponse? result;

  PostAddressResponse({
    this.action,
    this.message,
    this.statusCode,
    this.result,
  });

  factory PostAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$PostAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostAddressResponseToJson(this);
}
