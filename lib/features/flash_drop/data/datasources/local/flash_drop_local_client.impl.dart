part of 'flash_drop_local_client.dart';

class _FlashDropLocalClient implements FlashDropLocalClient {
  _FlashDropLocalClient();

  @override
  Future<WatchDataResponseModel> loadWatchData() async {
    String jsonString = await rootBundle.loadString('assets/watch_data.json');
    return WatchDataResponseModel.fromJson(json.decode(jsonString));
  }
}
