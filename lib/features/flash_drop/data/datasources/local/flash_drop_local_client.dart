import 'package:flutter/services.dart' show rootBundle;

part 'flash_drop_local_client.impl.dart';

abstract class FlashDropLocalClient {
  factory FlashDropLocalClient() = _FlashDropLocalClient;
  Future<String> loadWatchData();
}
