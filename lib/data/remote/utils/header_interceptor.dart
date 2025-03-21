import 'dart:async';

import 'package:chopper/chopper.dart';

import '../../../utils/injection.dart';
import '../../local/local_data_source.dart';

class HeaderInterceptor implements Interceptor {
  final LocalDataSource localData = getIt.get();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain,
  ) async {
    Request modifiedRequest = chain.request;
    final token = await localData.getAuthToken();
    if (token?.isNotEmpty == true) {
      modifiedRequest = applyHeader(
        modifiedRequest,
        'Authorization',
        'Token $token',
      );
    }
    modifiedRequest = applyHeader(
      modifiedRequest,
      'AccessToken',
      // TODO: ganti dengan access token dari Blueray Cargo API
      'API_ACCESS_TOKEN',
    );
    modifiedRequest = applyHeader(
      modifiedRequest,
      'Content-Type',
      'application/json',
    );
    return chain.proceed(modifiedRequest);
  }
}
