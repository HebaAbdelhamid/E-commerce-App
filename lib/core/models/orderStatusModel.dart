class OrderStatusModel {
  bool? status;
  Data? data;

  OrderStatusModel({this.status, this.data});

  OrderStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? shippingPriceWillBeReviewed;
  String? waitingForCustomerConfirmation;
  String? pending;
  String? inTheCart;
  String? inReview;
  String? inProgress;
  String? inDelivery;
  String? delivered;
  String? cancelled;
  String? cannotReach;
  String? clientRefused;

  Data(
      {this.shippingPriceWillBeReviewed,
        this.waitingForCustomerConfirmation,
        this.pending,
        this.inTheCart,
        this.inReview,
        this.inProgress,
        this.inDelivery,
        this.delivered,
        this.cancelled,
        this.cannotReach,
        this.clientRefused});

  Data.fromJson(Map<String, dynamic> json) {
    shippingPriceWillBeReviewed = json['Shipping_price_will_be_reviewed'];
    waitingForCustomerConfirmation = json['Waiting_for_customer_confirmation'];
    pending = json['pending'];
    inTheCart = json['In_the_cart'];
    inReview = json['in_review'];
    inProgress = json['in_progress'];
    inDelivery = json['in_delivery'];
    delivered = json['Delivered'];
    cancelled = json['Cancelled'];
    cannotReach = json['cannot_reach'];
    clientRefused = json['client_refused'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Shipping_price_will_be_reviewed'] = this.shippingPriceWillBeReviewed;
    data['Waiting_for_customer_confirmation'] =
        this.waitingForCustomerConfirmation;
    data['pending'] = this.pending;
    data['In_the_cart'] = this.inTheCart;
    data['in_review'] = this.inReview;
    data['in_progress'] = this.inProgress;
    data['in_delivery'] = this.inDelivery;
    data['Delivered'] = this.delivered;
    data['Cancelled'] = this.cancelled;
    data['cannot_reach'] = this.cannotReach;
    data['client_refused'] = this.clientRefused;
    return data;
  }
}
