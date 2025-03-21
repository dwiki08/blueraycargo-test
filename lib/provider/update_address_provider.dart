import 'dart:developer';

import 'package:blueraycargo/provider/state/data_state.dart';
import 'package:blueraycargo/utils/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/address.dart';
import '../data/model/error_result.dart';
import '../data/remote/remote_data_source.dart';
import '../utils/injection.dart';

class UpdateAddressProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  bool _successUpdate = false;

  bool get successUpdate => _successUpdate;

  Future<void> addOrEditAddress({
    required Address address,
    required String district,
  }) async {
    _state = DataState.isLoading;
    _successUpdate = false;
    notifyListeners();

    final isEdit = address.addressId != -1;

    final resultDistrictInfo = await _remoteDataSource.searchSubDistrict(
      query: district,
    );
    resultDistrictInfo.fold(
      (e) {
        _state = DataState.error;
        _error = e.copyWith(
          message: 'Data kota atau kecamatan tidak ditemukan.',
        );
      },
      (data) {
        _state = DataState.hasData;
        _error = null;
        address = address.copyWith(
          provinceName: data.first.province,
          districtName: data.first.district,
          subDistrictName: data.first.subDistrict,
          provinceId: data.first.provinceId,
          districtId: data.first.districtId,
          subDistrictId: data.first.subDistrictId,
        );
      },
    );

    if (address.provinceId == -1 ||
        address.districtId == -1 ||
        address.subDistrictId == -1 ||
        _error != null) {
      notifyListeners();
      return;
    }

    if (address.npwpFile.isNullOrEmpty() == false) {
      if (address.npwpFile!.startsWith('http') == false) {
        log('uploading....');
        final resultUpload = await _remoteDataSource.uploadImage(
          filePath: address.npwpFile!,
        );
        resultUpload.fold(
          (e) {
            address = address.copyWith(npwpFile: null);
          },
          (data) {
            address = address.copyWith(npwpFile: data);
          },
        );
      }
    }

    log('address: ${address.toString()}');

    if (isEdit && address.isPrimary == true) {
      await _remoteDataSource.setPrimaryAddress(addressId: address.addressId);
    }

    final result =
        isEdit
            ? await _remoteDataSource.editAddress(address: address)
            : await _remoteDataSource.createAddress(address: address);
    result.fold(
      (e) {
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _state = DataState.hasData;
        _successUpdate = true;
      },
    );
    notifyListeners();
  }

  Future<void> deleteAddress({required int addressId}) async {
    _successUpdate = false;
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.deleteAddress(addressId: addressId);
    result.fold(
      (e) {
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _state = DataState.hasData;
        _successUpdate = true;
      },
    );
    notifyListeners();
  }
}
