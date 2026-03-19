import 'package:dartz/dartz.dart';
import 'package:quickeee/core/exceptions/custom_exception.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';
import 'package:quickeee/features/flash_drop/domain/repository/flash_drop_repository.dart';

class LoadWatchDataUsecase {
  final FlashDropRepository _repository;
  const LoadWatchDataUsecase(this._repository);

  Future<Either<CustomException, WatchDataResponseModel>> call() async {
    return await _repository.loadWatchData();
  }
}
