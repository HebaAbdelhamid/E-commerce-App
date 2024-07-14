class CouponModel {
  bool? status;
  Data? data;

  CouponModel({this.status, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
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
  Coupon? coupon;
  int? total;
  int? totalAfterCoupon;

  Data({this.coupon, this.total, this.totalAfterCoupon});

  Data.fromJson(Map<String, dynamic> json) {
    coupon =
    json['coupon'] != null ? new Coupon.fromJson(json['coupon']) : null;
    total = json['total'];
    totalAfterCoupon = json['total_after_coupon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coupon != null) {
      data['coupon'] = this.coupon!.toJson();
    }
    data['total'] = this.total;
    data['total_after_coupon'] = this.totalAfterCoupon;
    return data;
  }
}

class Coupon {
  int? id;
  String? code;
  String? start;
  String? end;
  String? value;
  String? type;
  String? currency;

  Coupon(
      {this.id,
        this.code,
        this.start,
        this.end,
        this.value,
        this.type,
        this.currency});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    start = json['start'];
    end = json['end'];
    value = json['value'];
    type = json['type'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['start'] = this.start;
    data['end'] = this.end;
    data['value'] = this.value;
    data['type'] = this.type;
    data['currency'] = this.currency;
    return data;
  }
}
