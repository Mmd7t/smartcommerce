class ShippingFee {
  bool freeShippingEnabled;
  double freeMinimumShipping;
  double localPickupCost;
  bool localPickupEnabled;
  double flatRateCost;
  bool flatRateEnabled;

  factory ShippingFee.fromJson(Map json) {
    return ShippingFee(
      json["free_shipping_enabled"] ?? false,
      double.parse(json["free_shipping_min_amount"]) ?? 0.0,
      double.parse(json["local_pickup_cost"]) ?? 0.0,
      json["local_pickup_enabled"] == "1" ? true : false,
      double.parse(json["flat_rate_cost"]) ?? 0.0,
      json["flat_rate_enabled"] == "1" ? true : false,
    );
  }
  factory ShippingFee.empty() {
    return ShippingFee(
      false,
      0.0,
      0.0,
      false,
      0.0,
      false,
    );
  }

  ShippingFee(
      this.freeShippingEnabled,
      this.freeMinimumShipping,
      this.localPickupCost,
      this.localPickupEnabled,
      this.flatRateCost,
      this.flatRateEnabled);
}
