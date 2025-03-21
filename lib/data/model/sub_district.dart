import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_district.freezed.dart';

@freezed
abstract class SubDistrict with _$SubDistrict {
  const factory SubDistrict({
    required String address,
    required String province,
    required String district,
    required String subDistrict,
    required String subDistrictCode,
    required int provinceId,
    required int districtId,
    required int subDistrictId,
  }) = _SubDistrict;

  const SubDistrict._();
}
