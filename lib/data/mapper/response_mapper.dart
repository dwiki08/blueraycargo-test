import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/data/remote/response/address_response.dart';
import 'package:blueraycargo/utils/extensions.dart';

import '../model/sub_district.dart';
import '../remote/response/sub_district_response.dart';

extension AddressDTO on AddressResponse {
  Address toModel() {
    return Address(
      addressId: addressId.orEmpty(),
      label: addressLabel.orEmpty(),
      address: address.orEmpty(),
      name: name.orEmpty(),
      phoneNumber: phoneNumber.orEmpty(),
      email: email.orEmpty(),
      provinceName: provinceName.orEmpty(),
      districtName: districtName.orEmpty(),
      subDistrictName: subDistrictName.orEmpty(),
      provinceId: provinceId.orEmpty(),
      districtId: districtId.orEmpty(),
      subDistrictId: subDistrictId.orEmpty(),
      postalCode: postalCode.orEmpty(),
      lat: lat.orEmpty(),
      long: long.orEmpty(),
      addressMap: addressMap.orEmpty(),
      npwp: npwp,
      npwpFile: npwpFile,
      isPrimary: isPrimary ?? false,
    );
  }
}

extension SubDistrictDTO on SubDistrictResponse {
  SubDistrict toModel() {
    return SubDistrict(
      address: address.orEmpty(),
      province: province.orEmpty(),
      district: district.orEmpty(),
      subDistrict: subDistrict.orEmpty(),
      subDistrictCode: subDistrictCode.orEmpty(),
      provinceId: provinceId.orEmpty(),
      districtId: districtId.orEmpty(),
      subDistrictId: subDistrictId.orEmpty(),
    );
  }
}
