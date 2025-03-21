import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required int addressId,
    required String label,
    required String address,
    required String name,
    required String phoneNumber,
    String? email,
    required String provinceName,
    required String districtName,
    required String subDistrictName,
    required int provinceId,
    required int districtId,
    required int subDistrictId,
    required String postalCode,
    required double lat,
    required double long,
    required String addressMap,
    String? npwp,
    String? npwpFile,
    bool? isPrimary,
  }) = _Address;

  const Address._();
}
