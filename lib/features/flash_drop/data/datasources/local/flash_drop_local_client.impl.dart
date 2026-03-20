part of 'flash_drop_local_client.dart';

class _FlashDropLocalClient implements FlashDropLocalClient {
  _FlashDropLocalClient();

  @override
  Future<String> loadWatchData() async {
    String jsonString = await rootBundle.loadString('assets/watch_data.json');
    return jsonString;
  }
}
