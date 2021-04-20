class Calculator {
  static double getTotal(
      {double nonFreeShipping = 0,
      double total = 0,
      double freeShippingMinimum,
      bool freeShippingCoupon,
      double discount = 0.0,
      bool percentageDiscount = false,
      bool freeSippingEnabled = false}) {
    double shipping = getShippingFees(
      nonFreeShipping: nonFreeShipping,
      total: total,
      freeShippingMinimum: freeShippingMinimum,
      freeShippingCoupon: freeShippingCoupon,
      freeSippingEnabled: freeSippingEnabled,
    );
    if (percentageDiscount) {
      return total + shipping - ((total * discount) / 100);
    } else {
      return total + shipping - discount;
    }
  }

  static double getShippingFees(
      {double nonFreeShipping = 0,
      double total = 0,
      double freeShippingMinimum = 0.0,
      bool freeSippingEnabled = false,
      bool freeShippingCoupon = false}) {
    if (freeSippingEnabled == true) {
      if (freeShippingCoupon == true) {
        return 0.0;
      } else if (total >= freeShippingMinimum) {
        return 0.0;
      } else {
        return nonFreeShipping;
      }
    } else {
      return nonFreeShipping;
    }
  }
}
