import 'package:blueraycargo/data/remote/response/sub_district_response.dart';
import 'package:chopper/chopper.dart';

import '../response/address_response.dart';
import '../response/general_response.dart';
import '../response/login_response.dart';
import '../response/post_address_response.dart';
import '../response/search_sub_district_response.dart';
import '../response/upload_image_response.dart';
import '../utils/header_interceptor.dart';
import '../utils/json_converter.dart';
import 'api_service.dart';

const baseUrl = 'https://devuat.blueraycargo.id/api/blueray';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(baseUrl),
  services: [ApiService.create()],
  converter: JsonToTypeConverter({
    LoginResponse: (json) => LoginResponse.fromJson(json),
    GeneralResponse: (json) => GeneralResponse.fromJson(json),
    AddressResponse: (json) => AddressResponse.fromJson(json),
    List<AddressResponse>: (json) {
      if (json is List) {
        return json.map((item) => AddressResponse.fromJson(item)).toList();
      } else {
        return [];
      }
    },
    UploadImageResponse: (json) => UploadImageResponse.fromJson(json),
    PostAddressResponse: (json) => PostAddressResponse.fromJson(json),
    SearchSubDistrictResponse:
        (json) => SearchSubDistrictResponse.fromJson(json),
    SubDistrictResponse: (json) => SubDistrictResponse.fromJson(json),
  }),
  interceptors: [HeaderInterceptor()],
);
