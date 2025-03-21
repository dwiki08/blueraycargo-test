import 'package:blueraycargo/provider/state/data_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/local/local_data_source.dart';
import '../data/model/error_result.dart';
import '../data/remote/remote_data_source.dart';
import '../utils/injection.dart';

class AuthProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();
  final LocalDataSource _localDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  bool? _isLoggedIn;

  bool? get isLoggedIn => _isLoggedIn;

  bool? _isRegister;

  bool? get isRegister => _isRegister;

  Future<void> checkLogin() async {
    final token = await _localDataSource.getAuthToken();
    if (token?.isNotEmpty == true) {
      _isLoggedIn = true;
    }
  }

  Future<void> login({required String userId, required String password}) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.login(
      userId: userId,
      password: password,
    );
    result.mapAsync((token) async {
      await _localDataSource.setAuthToken(token);
    });
    result.fold(
      (e) {
        _state = DataState.error;
        _error = e;
        _isLoggedIn = false;
      },
      (_) {
        _state = DataState.hasData;
        _isLoggedIn = true;
      },
    );
    notifyListeners();
  }

  Future<void> registerMini({required String userId}) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.registerMini(userId: userId);
    result.fold(
      (e) {
        _isRegister = false;
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _isRegister = data;
        _state = DataState.hasData;
      },
    );
    notifyListeners();
  }

  Future<void> registerVerifyCode({
    required String userId,
    required String code,
  }) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.registerVerifyCode(
      userId: userId,
      code: code,
    );
    result.fold(
      (e) {
        _isRegister = false;
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _isRegister = data;
        _state = DataState.hasData;
      },
    );
    notifyListeners();
  }

  Future<void> registerMandatory({
    required String userId,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.registerMandatory(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );
    result.fold(
      (e) {
        _isRegister = false;
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _isRegister = data;
        _state = DataState.hasData;
      },
    );
    notifyListeners();
  }

  Future<void> logout() async {
    _state = DataState.isLoading;
    await _localDataSource.clearAuthToken();
    await _remoteDataSource.logout();
    _state = DataState.noData;
    _isLoggedIn = false;
    notifyListeners();
  }
}
