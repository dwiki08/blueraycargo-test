import 'package:get_it/get_it.dart';

import '../data/local/local_data_source.dart';
import '../data/remote/remote_data_source.dart';
import '../data/remote/service/api_service.dart';
import '../data/remote/service/chopper_client.dart';

final getIt = GetIt.instance;

void setupInjection() {
  getIt.registerSingleton<LocalDataSource>(LocalDataSource());

  getIt.registerSingleton<ApiService>(chopperClient.getService<ApiService>());

  getIt.registerSingleton<RemoteDataSource>(RemoteDataSource());
}
