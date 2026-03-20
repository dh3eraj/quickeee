class WatchDataResponseModel {
  final String? watchId;
  final String? watchName;
  final double? basePrice;
  final String? currency;
  final int? totalQuantity;
  final List<WatchUpdate>? updates;

  WatchDataResponseModel({
    this.watchId,
    this.watchName,
    this.currency,
    this.basePrice,
    this.totalQuantity,
    this.updates,
  });

  factory WatchDataResponseModel.fromJson(Map<String, dynamic> json) =>
      WatchDataResponseModel(
        watchId: json["watchId"],
        watchName: json["watchName"],
        currency: json["currency"],
        basePrice: json["basePrice"],
        totalQuantity: json["totalQuantity"],
        updates: json["updates"] == null
            ? []
            : List<WatchUpdate>.from(
                json["updates"]!.map((x) => WatchUpdate.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "watchId": watchId,
    "watchName": watchName,
    "currency": currency,
    "basePrice": basePrice,
    "totalQuantity": totalQuantity,
    "updates": updates == null
        ? []
        : List<dynamic>.from(updates!.map((x) => x.toJson())),
  };
}

class WatchUpdate {
  final DateTime? timestamp;
  final double? currentPrice;
  final int? remainingInventory;

  WatchUpdate({this.timestamp, this.currentPrice, this.remainingInventory});

  factory WatchUpdate.fromJson(Map<String, dynamic> json) => WatchUpdate(
    timestamp: json["timestamp"] == null
        ? null
        : DateTime.parse(json["timestamp"]),
    currentPrice: json["currentPrice"],
    remainingInventory: json["remainingInventory"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "currentPrice": currentPrice,
    "remainingInventory": remainingInventory,
  };
}
