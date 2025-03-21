// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<LoginResponse>> postLogin(Map<String, String> body) {
    final Uri $url = Uri.parse('/customer/login');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postRegisterMini(Map<String, String> body) {
    final Uri $url = Uri.parse('/customer/register/mini');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postRegisterVerifyCode(
    Map<String, String> body,
  ) {
    final Uri $url = Uri.parse('/customer/register/verify-code');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postRegisterMandatory(
    Map<String, String> body,
  ) {
    final Uri $url = Uri.parse('/customer/register/mandatory');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postLogout() {
    final Uri $url = Uri.parse('/customer/logout');
    final Request $request = Request('POST', $url, client.baseUrl);
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<PostAddressResponse>> postAddress(PostAddressRequest body) {
    final Uri $url = Uri.parse('/customer/address');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PostAddressResponse, PostAddressResponse>($request);
  }

  @override
  Future<Response<PostAddressResponse>> putAddress(
    int addressId,
    PostAddressRequest body,
  ) {
    final Uri $url = Uri.parse('/customer/address/${addressId}');
    final $body = body;
    final Request $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<PostAddressResponse, PostAddressResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> deleteAddress(Map<String, int> body) {
    final Uri $url = Uri.parse('/customer/address/delete');
    final $body = body;
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postPrimaryAddress(Map<String, int> body) {
    final Uri $url = Uri.parse('/customer/address/primary');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<List<AddressResponse>>> getAddressList() {
    final Uri $url = Uri.parse('/customer/address');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<List<AddressResponse>, AddressResponse>($request);
  }

  @override
  Future<Response<UploadImageResponse>> postUploadImage(
    List<PartValue<dynamic>> requestParams,
  ) {
    final Uri $url = Uri.parse('/image/upload');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = requestParams;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<UploadImageResponse, UploadImageResponse>($request);
  }

  @override
  Future<Response<SearchSubDistrictResponse>> getSearchDistrict({
    required String q,
  }) {
    final Uri $url = Uri.parse('/address/subdistricts/search');
    final Map<String, dynamic> $params = <String, dynamic>{'q': q};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SearchSubDistrictResponse, SearchSubDistrictResponse>(
      $request,
    );
  }
}
