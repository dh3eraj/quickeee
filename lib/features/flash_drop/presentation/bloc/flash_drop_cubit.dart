import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';
import 'package:quickeee/features/flash_drop/domain/usecases/load_watch_data_usecase.dart';

part 'flash_drop_state.dart';
part 'flash_drop_cubit.freezed.dart';

class FlashDropCubit extends Cubit<FlashDropState> {
  final LoadWatchDataUsecase _loadWatchDataUsecase;
  FlashDropCubit(this._loadWatchDataUsecase) : super(FlashDropState.initial());

  Future<void> loadWatchData() async {
    emit(const FlashDropState.loadingWatchData());
    final response = await _loadWatchDataUsecase();
    response.fold(
      (error) {
        emit(FlashDropState.loadWatchDataError(error.message));
      },
      (watchData) {
        emit(FlashDropState.loadedWatchData(watchData));
      },
    );
  }
}
