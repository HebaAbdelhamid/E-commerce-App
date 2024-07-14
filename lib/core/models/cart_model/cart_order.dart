import '../addToCartModel.dart';
import 'cart_item.dart';

class CartOrder {
  int? id;
  int? subTotal;
  String? sourceKey;
  String? source;
  int? discount;
  int? couponValue;
  String? coupon;
  int? grandTotal;
  int? cashback;
  bool? dayReturns;
  int? shippingFees;
  String? pointDiscount;
  String? company;
  String? companyId;
  String? representative;
  String? representativeId;
  String? saleRepresentativeId;
  String? saleRepresentative;
  String? statusKey;
  String? status;
  String? createdAt;
  int? itemsCount;
  bool? rateExists;
  int? productsCount;
  int? onePaice;
  int? tex;
  String? currency;
  List<CartItems>? items;
  List<Null>? deposits;
  List<Null>? reminders;
  String? whatsapp;
  String? name;
  String? phone;
  int? actualShippingFees;
  String? orderType;
  String? dateCanceled;
  User? user;
  int? grandTotalAfterDeposit;
  int? deposit;

  CartOrder(
      {this.id,
        this.subTotal,
        this.sourceKey,
        this.source,
        this.discount,
        this.couponValue,
        this.coupon,
        this.grandTotal,
        this.cashback,
        this.dayReturns,
        this.shippingFees,
        this.pointDiscount,
        this.company,
        this.companyId,
        this.representative,
        this.representativeId,
        this.saleRepresentativeId,
        this.saleRepresentative,
        this.statusKey,
        this.status,
        this.createdAt,
        this.itemsCount,
        this.rateExists,
        this.productsCount,
        this.onePaice,
        this.tex,
        this.currency,
        this.items,
        this.deposits,
        this.reminders,
        this.whatsapp,
        this.name,
        this.phone,
        this.actualShippingFees,
        this.orderType,
        this.dateCanceled,
        this.user,
        this.grandTotalAfterDeposit,
        this.deposit});

  CartOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subTotal = json['sub_total'];
    sourceKey = json['source_key'];
    source = json['source'];
    discount = json['discount'];
    couponValue = json['coupon_value'];
    coupon = json['coupon'];
    grandTotal = json['grand_total'];
    cashback = json['cashback'];
    dayReturns = json['day_returns'];
    shippingFees = json['shipping_fees'];
    pointDiscount = json['point_discount'];
    company = json['company'];
    companyId = json['company_id'];
    representative = json['representative'];
    representativeId = json['representative_id'];
    saleRepresentativeId = json['sale_representative_id'];
    saleRepresentative = json['sale_representative'];
    statusKey = json['status_key'];
    status = json['status'];
    createdAt = json['created_at'];
    itemsCount = json['items_count'];
    rateExists = json['rate_exists'];
    productsCount = json['products_count'];
    onePaice = json['one_paice'];
    tex = json['tex'];
    currency = json['currency'];
    if (json['items'] != null) {
      items = <CartItems>[];
      json['items'].forEach((v) {
        items!.add(new CartItems.fromJson(v));
      });
    }


    whatsapp = json['whatsapp'];
    name = json['name'];
    phone = json['phone'];
    actualShippingFees = json['actual_shipping_fees'];
    orderType = json['order_type'];
    dateCanceled = json['date_canceled'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    grandTotalAfterDeposit = json['grand_total_after_deposit'];
    deposit = json['deposit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_total'] = this.subTotal;
    data['source_key'] = this.sourceKey;
    data['source'] = this.source;
    data['discount'] = this.discount;
    data['coupon_value'] = this.couponValue;
    data['coupon'] = this.coupon;
    data['grand_total'] = this.grandTotal;
    data['cashback'] = this.cashback;
    data['day_returns'] = this.dayReturns;
    data['shipping_fees'] = this.shippingFees;
    data['point_discount'] = this.pointDiscount;
    data['company'] = this.company;
    data['company_id'] = this.companyId;
    data['representative'] = this.representative;
    data['representative_id'] = this.representativeId;
    data['sale_representative_id'] = this.saleRepresentativeId;
    data['sale_representative'] = this.saleRepresentative;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['items_count'] = this.itemsCount;
    data['rate_exists'] = this.rateExists;
    data['products_count'] = this.productsCount;
    data['one_paice'] = this.onePaice;
    data['tex'] = this.tex;
    data['currency'] = this.currency;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['whatsapp'] = this.whatsapp;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['actual_shipping_fees'] = this.actualShippingFees;
    data['order_type'] = this.orderType;
    data['date_canceled'] = this.dateCanceled;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['grand_total_after_deposit'] = this.grandTotalAfterDeposit;
    data['deposit'] = this.deposit;
    return data;
  }
}
