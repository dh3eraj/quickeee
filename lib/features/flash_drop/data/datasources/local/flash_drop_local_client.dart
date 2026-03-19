import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;
import 'package:quickeee/features/flash_drop/data/models/watch_data_response_model.dart';

part 'flash_drop_local_client.impl.dart';

abstract class FlashDropLocalClient {
  factory FlashDropLocalClient() = _FlashDropLocalClient;
  Future<WatchDataResponseModel> loadWatchData();
}
