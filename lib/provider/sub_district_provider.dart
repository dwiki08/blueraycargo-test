import 'package:blueraycargo/data/model/sub_district.dart';
import 'package:blueraycargo/provider/state/data_state.dart';
import 'package:flutter/cupertino.dart';

import '../data/model/error_result.dart';
import '../data/remote/remote_data_source.dart';
import '../utils/injection.dart';

class SubDistrictProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  List<SubDistrict> _subDistricts = [];

  List<SubDistrict> get subDistricts => _subDistricts;

  Future<void> searchSubDistrict({required String query}) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.searchSubDistrict(query: query);
    result.fold(
      (e) {
        _state = DataState.error;
        _error = e;
      },
      (data) {
        _subDistricts = data;
        _state = DataState.hasData;
      },
    );
    notifyListeners();
  }
}
