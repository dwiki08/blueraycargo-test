import 'package:blueraycargo/data/remote/request/post_address_request.dart';
import 'package:blueraycargo/data/remote/response/address_response.dart';
import 'package:blueraycargo/data/remote/response/general_response.dart';
import 'package:blueraycargo/data/remote/response/post_address_response.dart';
import 'package:blueraycargo/data/remote/response/upload_image_response.dart';
import 'package:chopper/chopper.dart';

import '../response/login_response.dart';
import '../response/search_sub_district_response.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @POST(path: '/customer/login')
  Future<Response<LoginResponse>> postLogin(@Body() Map<String, String> body);

  @POST(path: '/customer/register/mini')
  Future<Response<GeneralResponse>> postRegisterMini(
    @Body() Map<String, String> body,
  );

  @POST(path: '/customer/register/verify-code')
  Future<Response<GeneralResponse>> postRegisterVerifyCode(
    @Body() Map<String, String> body,
  );

  @POST(path: '/customer/register/mandatory')
  Future<Response<GeneralResponse>> postRegisterMandatory(
    @Body() Map<String, String> body,
  );

  @POST(path: '/customer/logout')
  Future<Response<GeneralResponse>> postLogout();

  @POST(path: '/customer/address')
  Future<Response<PostAddressResponse>> postAddress(
    @Body() PostAddressRequest body,
  );

  @PUT(path: '/customer/address/{address_id}')
  Future<Response<PostAddressResponse>> putAddress(
    @Path('address_id') int addressId,
    @Body() PostAddressRequest body,
  );

  @DELETE(path: '/customer/address/delete')
  Future<Response<GeneralResponse>> deleteAddress(
    @Body() Map<String, int> body,
  );

  @POST(path: '/customer/address/primary')
  Future<Response<GeneralResponse>> postPrimaryAddress(
    @Body() Map<String, int> body,
  );

  @GET(path: '/customer/address')
  Future<Response<List<AddressResponse>>> getAddressList();

  @POST(path: "/image/upload", headers: {'Content-Type': 'multipart/form-data'})
  @Multipart()
  Future<Response<UploadImageResponse>> postUploadImage(
    @PartMap() List<PartValue> requestParams,
  );

  @GET(path: '/address/subdistricts/search')
  Future<Response<SearchSubDistrictResponse>> getSearchDistrict({
    @Query('q') required String q,
  });
}
