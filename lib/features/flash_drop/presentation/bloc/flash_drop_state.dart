part of 'flash_drop_cubit.dart';

@freezed
class FlashDropState with _$FlashDropState {
  const factory FlashDropState.initial() = _Initial;

  //Load Watch Data
  const factory FlashDropState.loadingWatchData() = _LoadingWatchData;
  const factory FlashDropState.loadedWatchData(
    WatchDataResponseModel watchData,
  ) = _LoadedWatchData;
  const factory FlashDropState.loadWatchDataError(String error) =
      _LoadWatchDataError;
}
