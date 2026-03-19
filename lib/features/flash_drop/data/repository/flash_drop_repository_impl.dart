import 'dart:convert' show json;

import 'package:dartz/dartz.dart';
import 'package:quickeee/core/exceptions/custom_exception.dart';
import 'package:quickeee/features/flash_drop/data/datasources/local/flash_drop_local_client.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';
import 'package:quickeee/features/flash_drop/domain/repository/flash_drop_repository.dart';

class FlashDropRepositoryImpl implements FlashDropRepository {
  final FlashDropLocalClient _flashDropLocalClient;
  const FlashDropRepositoryImpl(this._flashDropLocalClient);
  @override
  Future<Either<CustomException, WatchDataResponseModel>>
  loadWatchData() async {
    try {
      final jsonString = await _flashDropLocalClient.loadWatchData();
      return right(WatchDataResponseModel.fromJson(json.decode(jsonString)));
    } catch (_) {
      return left(CustomException());
    }
  }
}
