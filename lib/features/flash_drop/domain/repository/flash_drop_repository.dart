import 'package:dartz/dartz.dart' show Either;
import 'package:quickeee/core/exceptions/custom_exception.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';

abstract class FlashDropRepository {
  Future<Either<CustomException, WatchDataResponseModel>> loadWatchData();
}
