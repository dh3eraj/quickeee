class WatchDataResponseModel {
  final String? watchId;
  final int? basePrice;
  final int? totalQuantity;
  final List<WatchUpdate>? updates;

  WatchDataResponseModel({
    this.watchId,
    this.basePrice,
    this.totalQuantity,
    this.updates,
  });

  factory WatchDataResponseModel.fromJson(Map<String, dynamic> json) =>
      WatchDataResponseModel(
        watchId: json["watchId"],
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
    "basePrice": basePrice,
    "totalQuantity": totalQuantity,
    "updates": updates == null
        ? []
        : List<dynamic>.from(updates!.map((x) => x.toJson())),
  };
}

class WatchUpdate {
  final DateTime? timestamp;
  final int? currentPrice;
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
