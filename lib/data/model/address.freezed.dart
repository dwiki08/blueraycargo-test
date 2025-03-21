// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Address {

  int get addressId;

  String get label;

  String get address;

  String get name;

  String get phoneNumber;

  String? get email;

  String get provinceName;

  String get districtName;

  String get subDistrictName;

  int get provinceId;

  int get districtId;

  int get subDistrictId;

  String get postalCode;

  double get lat;

  double get long;

  String get addressMap;

  String? get npwp;

  String? get npwpFile;

  bool? get isPrimary;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressCopyWith<Address> get copyWith =>
      _$AddressCopyWithImpl<Address>(this as Address, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Address &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.subDistrictName, subDistrictName) ||
                other.subDistrictName == subDistrictName) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.addressMap, addressMap) ||
                other.addressMap == addressMap) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.npwpFile, npwpFile) ||
                other.npwpFile == npwpFile) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }


  @override
  int get hashCode =>
      Object.hashAll([
        runtimeType,
        addressId,
        label,
        address,
        name,
        phoneNumber,
        email,
        provinceName,
        districtName,
        subDistrictName,
        provinceId,
        districtId,
        subDistrictId,
        postalCode,
        lat,
        long,
        addressMap,
        npwp,
        npwpFile,
        isPrimary
      ]);

  @override
  String toString() {
    return 'Address(addressId: $addressId, label: $label, address: $address, name: $name, phoneNumber: $phoneNumber, email: $email, provinceName: $provinceName, districtName: $districtName, subDistrictName: $subDistrictName, provinceId: $provinceId, districtId: $districtId, subDistrictId: $subDistrictId, postalCode: $postalCode, lat: $lat, long: $long, addressMap: $addressMap, npwp: $npwp, npwpFile: $npwpFile, isPrimary: $isPrimary)';
  }


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value,
      $Res Function(Address) _then) = _$AddressCopyWithImpl;

  @useResult
  $Res call({
    int addressId, String label, String address, String name, String phoneNumber, String? email, String provinceName, String districtName, String subDistrictName, int provinceId, int districtId, int subDistrictId, String postalCode, double lat, double long, String addressMap, String? npwp, String? npwpFile, bool? isPrimary
  });


}

/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? addressId = null, Object? label = null, Object? address = null, Object? name = null, Object? phoneNumber = null, Object? email = freezed, Object? provinceName = null, Object? districtName = null, Object? subDistrictName = null, Object? provinceId = null, Object? districtId = null, Object? subDistrictId = null, Object? postalCode = null, Object? lat = null, Object? long = null, Object? addressMap = null, Object? npwp = freezed, Object? npwpFile = freezed, Object? isPrimary = freezed,}) {
    return _then(_self.copyWith(
      addressId: null == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
      as int,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
      as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
      as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
      as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
      as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
      as String?,
      provinceName: null == provinceName
          ? _self.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
      as String,
      districtName: null == districtName
          ? _self.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
      as String,
      subDistrictName: null == subDistrictName
          ? _self.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
      as String,
      provinceId: null == provinceId
          ? _self.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
      as int,
      districtId: null == districtId
          ? _self.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
      as int,
      subDistrictId: null == subDistrictId
          ? _self.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
      as int,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
      as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
      as double,
      long: null == long
          ? _self.long
          : long // ignore: cast_nullable_to_non_nullable
      as double,
      addressMap: null == addressMap
          ? _self.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
      as String,
      npwp: freezed == npwp
          ? _self.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
      as String?,
      npwpFile: freezed == npwpFile
          ? _self.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
      as String?,
      isPrimary: freezed == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
      as bool?,
    ));
  }

}


/// @nodoc


class _Address extends Address {
  const _Address(
      {required this.addressId, required this.label, required this.address, required this.name, required this.phoneNumber, this.email, required this.provinceName, required this.districtName, required this.subDistrictName, required this.provinceId, required this.districtId, required this.subDistrictId, required this.postalCode, required this.lat, required this.long, required this.addressMap, this.npwp, this.npwpFile, this.isPrimary})
      : super._();


  @override final int addressId;
  @override final String label;
  @override final String address;
  @override final String name;
  @override final String phoneNumber;
  @override final String? email;
  @override final String provinceName;
  @override final String districtName;
  @override final String subDistrictName;
  @override final int provinceId;
  @override final int districtId;
  @override final int subDistrictId;
  @override final String postalCode;
  @override final double lat;
  @override final double long;
  @override final String addressMap;
  @override final String? npwp;
  @override final String? npwpFile;
  @override final bool? isPrimary;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Address &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.subDistrictName, subDistrictName) ||
                other.subDistrictName == subDistrictName) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.addressMap, addressMap) ||
                other.addressMap == addressMap) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.npwpFile, npwpFile) ||
                other.npwpFile == npwpFile) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }


  @override
  int get hashCode =>
      Object.hashAll([
        runtimeType,
        addressId,
        label,
        address,
        name,
        phoneNumber,
        email,
        provinceName,
        districtName,
        subDistrictName,
        provinceId,
        districtId,
        subDistrictId,
        postalCode,
        lat,
        long,
        addressMap,
        npwp,
        npwpFile,
        isPrimary
      ]);

  @override
  String toString() {
    return 'Address(addressId: $addressId, label: $label, address: $address, name: $name, phoneNumber: $phoneNumber, email: $email, provinceName: $provinceName, districtName: $districtName, subDistrictName: $subDistrictName, provinceId: $provinceId, districtId: $districtId, subDistrictId: $subDistrictId, postalCode: $postalCode, lat: $lat, long: $long, addressMap: $addressMap, npwp: $npwp, npwpFile: $npwpFile, isPrimary: $isPrimary)';
  }


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value,
      $Res Function(_Address) _then) = __$AddressCopyWithImpl;

  @override
  @useResult
  $Res call({
    int addressId, String label, String address, String name, String phoneNumber, String? email, String provinceName, String districtName, String subDistrictName, int provinceId, int districtId, int subDistrictId, String postalCode, double lat, double long, String addressMap, String? npwp, String? npwpFile, bool? isPrimary
  });


}

/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call(
      {Object? addressId = null, Object? label = null, Object? address = null, Object? name = null, Object? phoneNumber = null, Object? email = freezed, Object? provinceName = null, Object? districtName = null, Object? subDistrictName = null, Object? provinceId = null, Object? districtId = null, Object? subDistrictId = null, Object? postalCode = null, Object? lat = null, Object? long = null, Object? addressMap = null, Object? npwp = freezed, Object? npwpFile = freezed, Object? isPrimary = freezed,}) {
    return _then(_Address(
      addressId: null == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
      as int,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
      as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
      as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
      as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
      as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
      as String?,
      provinceName: null == provinceName
          ? _self.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
      as String,
      districtName: null == districtName
          ? _self.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
      as String,
      subDistrictName: null == subDistrictName
          ? _self.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
      as String,
      provinceId: null == provinceId
          ? _self.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
      as int,
      districtId: null == districtId
          ? _self.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
      as int,
      subDistrictId: null == subDistrictId
          ? _self.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
      as int,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
      as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
      as double,
      long: null == long
          ? _self.long
          : long // ignore: cast_nullable_to_non_nullable
      as double,
      addressMap: null == addressMap
          ? _self.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
      as String,
      npwp: freezed == npwp
          ? _self.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
      as String?,
      npwpFile: freezed == npwpFile
          ? _self.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
      as String?,
      isPrimary: freezed == isPrimary
          ? _self.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
      as bool?,
    ));
  }


}

// dart format on
