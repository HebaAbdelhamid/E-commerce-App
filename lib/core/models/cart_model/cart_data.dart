import '../addToCartModel.dart';

class CartData {
  Order? order;
  int? wallet;
  String? tex;

  CartData({this.order, this.wallet, this.tex});

  CartData.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    wallet = json['wallet'];
    tex = json['tex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['wallet'] = this.wallet;
    data['tex'] = this.tex;
    return data;
  }
}
