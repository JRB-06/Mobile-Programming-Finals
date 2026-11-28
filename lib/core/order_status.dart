enum OrderStatus {
  paid,
  packed,
  shipped,
  delivered,
  cancelled;

  OrderStatus? get next => switch (this) {
    paid => packed,
    packed => shipped,
    shipped => delivered,
    delivered || cancelled => null,
  };

  bool get canCustomerCancel => this == paid || this == packed;

  bool get canAdminCancel => this == paid || this == packed || this == shipped;
}
