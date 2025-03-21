import 'package:blueraycargo/data/model/address.dart';
import 'package:blueraycargo/provider/state/data_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/error_result.dart';
import '../data/remote/remote_data_source.dart';
import '../utils/injection.dart';

class AddressProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  int page = 1;
  int sizeItems = 10;

  Future<void> getAddressList() async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.getAddressList();
    result.fold(
      (e) {
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _addresses = data;
        if (_addresses.isEmpty) {
          _state = DataState.noData;
        } else {
          _state = DataState.hasData;
        }
      },
    );
    notifyListeners();
  }
}
