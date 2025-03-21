import 'package:json_annotation/json_annotation.dart';

part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
  @JsonKey(name: "action")
  bool? action;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  int? status;

  GeneralResponse({this.action, this.message, this.status});

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
