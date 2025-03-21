import 'dart:io';

import 'package:blueraycargo/data/mapper/response_mapper.dart';
import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/data/remote/request/post_address_request.dart';
import 'package:blueraycargo/data/remote/service/api_service.dart';
import 'package:chopper/chopper.dart';
import 'package:either_dart/either.dart';

import '../../utils/injection.dart';
import '../model/error_result.dart';
import '../model/sub_district.dart';

class RemoteDataSource {
  final ApiService _apiService = getIt.get<ApiService>();

  Exception errorParsing() => Exception('Error parsing data');

  Future<Either<ErrorResult, bool>> logout() async {
    try {
      final response = await _apiService.postLogout();
      if (response.isSuccessful) {
        return const Right(true);
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> registerMini({
    required String userId,
  }) async {
    try {
      final response = await _apiService.postRegisterMini({"user_id": userId});
      if (response.isSuccessful) {
        if (response.body?.action == true) {
          return Right(true);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> registerVerifyCode({
    required String userId,
    required String code,
  }) async {
    try {
      final response = await _apiService.postRegisterVerifyCode({
        "user_id": userId,
        "code": code,
      });
      if (response.isSuccessful) {
        if (response.body?.action == true) {
          return Right(true);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> registerMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final response = await _apiService.postRegisterMandatory({
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
      });
      if (response.isSuccessful) {
        if (response.body?.action == true) {
          return Right(true);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, String>> login({
    required String userId,
    required String password,
  }) async {
    try {
      final response = await _apiService.postLogin({
        "user_id": userId,
        "password": password,
      });
      if (response.isSuccessful) {
        if (response.body?.login == true) {
          final token = response.body?.token ?? '';
          return Right(token);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, List<Address>>> getAddressList() async {
    try {
      final response = await _apiService.getAddressList();
      if (response.isSuccessful) {
        if (response.body == null) {
          return const Right([]);
        } else {
          // Ordering address and put primary address on top
          final addresses = response.body?.map((e) => e.toModel()).toList();
          addresses?.sort((a, b) => a.addressId.compareTo(b.addressId));
          try {
            final primaryAddress = addresses?.firstWhere(
              (e) => e.isPrimary == true,
            );
            if (primaryAddress != null) {
              addresses?.removeWhere((e) => e.isPrimary == true);
              addresses?.insert(0, primaryAddress);
            }
          } catch (_) {}
          return Right(addresses!);
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, List<SubDistrict>>> searchSubDistrict({
    required String query,
  }) async {
    try {
      final response = await _apiService.getSearchDistrict(
        q: query.trim().toLowerCase(),
      );
      if (response.isSuccessful) {
        final data =
            response.body?.data?.map((e) => e.toModel()).toList() ?? [];
        if (data.isNotEmpty) {
          return Right(data);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, Address>> createAddress({
    required Address address,
  }) async {
    try {
      final response = await _apiService.postAddress(
        PostAddressRequest(
          label: address.label,
          address: address.address,
          name: address.name,
          phoneNumber: address.phoneNumber,
          email: address.email,
          provinceId: address.provinceId,
          districtId: address.districtId,
          subDistrictId: address.subDistrictId,
          postalCode: address.postalCode,
          lat: address.lat,
          long: address.long,
          addressMap: address.addressMap,
          npwp: address.npwp,
          npwpFile: address.npwpFile,
        ),
      );
      if (response.isSuccessful) {
        final address = response.body?.result?.toModel();
        if (address == null) {
          throw errorParsing();
        } else {
          return Right(address);
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, Address>> editAddress({
    required Address address,
  }) async {
    try {
      final response = await _apiService.putAddress(
        address.addressId,
        PostAddressRequest(
          label: address.label,
          address: address.address,
          name: address.name,
          phoneNumber: address.phoneNumber,
          email: address.email,
          provinceId: address.provinceId,
          districtId: address.districtId,
          subDistrictId: address.subDistrictId,
          postalCode: address.postalCode,
          lat: address.lat,
          long: address.long,
          addressMap: address.addressMap,
          npwp: address.npwp,
          npwpFile: address.npwpFile,
        ),
      );
      if (response.isSuccessful) {
        final address = response.body?.result?.toModel();
        if (address == null) {
          throw errorParsing();
        } else {
          return Right(address);
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> deleteAddress({
    required int addressId,
  }) async {
    try {
      final response = await _apiService.deleteAddress({
        "address_id": addressId,
      });
      if (response.isSuccessful) {
        if (response.body?.action == true) {
          return Right(true);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> setPrimaryAddress({
    required int addressId,
  }) async {
    try {
      final response = await _apiService.postPrimaryAddress({
        "address_id": addressId,
      });
      if (response.isSuccessful) {
        if (response.body?.action == true) {
          return Right(true);
        } else {
          return Left(ErrorResult(message: response.body?.message));
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, String>> uploadImage({
    required String filePath,
  }) async {
    try {
      List<PartValue> requestParams = [PartValueFile("image_file", filePath)];
      final response = await _apiService.postUploadImage(requestParams);
      if (response.isSuccessful) {
        return Right(response.body?.imageUrl ?? '');
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }
}
