class PostReturnOrderModel {
  bool? status;
  Data? data;

  PostReturnOrderModel({this.status, this.data});

  PostReturnOrderModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? orderId;
  int? grandTotal;
  int? subTotal;
  String? returnDate;
  String? orderDate;
  int? discount;
  String? address;
  String? status;
  String? statusKey;
  String? name;
  String? currency;

  Data(
      {this.id,
        this.orderId,
        this.grandTotal,
        this.subTotal,
        this.returnDate,
        this.orderDate,
        this.discount,
        this.address,
        this.status,
        this.statusKey,
        this.name,
        this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    grandTotal = json['grand_total'];
    subTotal = json['sub_total'];
    returnDate = json['return_date'];
    orderDate = json['order_date'];
    discount = json['discount'];
    address = json['address'];
    status = json['status'];
    statusKey = json['status_key'];
    name = json['name'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['grand_total'] = this.grandTotal;
    data['sub_total'] = this.subTotal;
    data['return_date'] = this.returnDate;
    data['order_date'] = this.orderDate;
    data['discount'] = this.discount;
    data['address'] = this.address;
    data['status'] = this.status;
    data['status_key'] = this.statusKey;
    data['name'] = this.name;
    data['currency'] = this.currency;
    return data;
  }
}
