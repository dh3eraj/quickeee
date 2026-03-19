import 'package:dartz/dartz.dart' show Either;
import 'package:quickeee/core/exceptions/custom_exception.dart';

abstract class LuxuryFlashDropRepository {
  Future<Either<CustomException, dynamic>> loadWatchData();
}
