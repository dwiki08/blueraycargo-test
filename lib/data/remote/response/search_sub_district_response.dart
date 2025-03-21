import 'package:blueraycargo/data/remote/response/sub_district_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_sub_district_response.g.dart';

@JsonSerializable()
class SearchSubDistrictResponse {
  @JsonKey(name: "action")
  bool? action;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<SubDistrictResponse>? data;

  SearchSubDistrictResponse({this.action, this.message, this.data});

  factory SearchSubDistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchSubDistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSubDistrictResponseToJson(this);
}
