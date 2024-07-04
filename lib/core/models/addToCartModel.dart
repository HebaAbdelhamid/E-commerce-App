class AddtoCartModel {
  bool? status;
  String? message;
  Data? data;

  AddtoCartModel({this.status, this.message, this.data});

  AddtoCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Order? order;

  Data({this.order});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;

  int? subTotal;

  int? couponValue;
  String? coupon;
  int? grandTotal;

  bool? dayReturns;

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
  String? itemsCount;
  bool? rateExists;
  int? productsCount;
  int? onePaice;
  int? tex;
  String? currency;
  List<Items>? items;
  List<Null>? deposits;
  List<Null>? reminders;
  String? whatsapp;
  String? name;
  String? phone;
  String? orderType;
  String? dateCanceled;
  User? user;
  int? grandTotalAfterDeposit;

  Order(
      {this.id,
        this.subTotal,
        this.couponValue,
        this.coupon,
        this.grandTotal,
        this.dayReturns,
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
        this.orderType,
        this.dateCanceled,
        this.user,
        this.grandTotalAfterDeposit,
       });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subTotal = json['sub_total'];
    couponValue = json['coupon_value'];
    coupon = json['coupon'];
    dayReturns = json['day_returns'];
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
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }


    whatsapp = json['whatsapp'];
    name = json['name'];
    phone = json['phone'];
    orderType = json['order_type'];
    dateCanceled = json['date_canceled'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    grandTotalAfterDeposit = json['grand_total_after_deposit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_total'] = this.subTotal;
    data['coupon_value'] = this.couponValue;
    data['coupon'] = this.coupon;
    data['grand_total'] = this.grandTotal;
    data['day_returns'] = this.dayReturns;
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
    data['order_type'] = this.orderType;
    data['date_canceled'] = this.dateCanceled;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['grand_total_after_deposit'] = this.grandTotalAfterDeposit;
    return data;
  }
}

class Items {
  int? id;
  int? productId;
  String? productName;
  String? productImage;
  int? productQuantity;
  int? price;
  int? quantity;
  int? grandTotal;
  String? currency;
  int? quantityReturn;
  List<Images>? images;

  Items(
      {this.id,
        this.productId,
        this.productName,
        this.productImage,
        this.productQuantity,
        this.price,
        this.quantity,
        this.grandTotal,
        this.currency,
        this.quantityReturn,
        this.images});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productQuantity = json['product_quantity'];
    price = json['price'];
    quantity = json['quantity'];
    grandTotal = json['grand_total'];
    currency = json['currency'];
    quantityReturn = json['quantity_return'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['product_quantity'] = this.productQuantity;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['grand_total'] = this.grandTotal;
    data['currency'] = this.currency;
    data['quantity_return'] = this.quantityReturn;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? url;

  Images({this.id, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? card;
  String? userType;
  String? gender;
  String? phone;
  String? phonecode;
  String? phoneWithCode;
  String? email;
  String? avatar;
  int? isActive;
  String? tex;
  String? createdAt;

  User(
      {this.id,
        this.name,
        this.card,
        this.userType,
        this.gender,
        this.phone,
        this.phonecode,
        this.phoneWithCode,
        this.email,
        this.avatar,
        this.isActive,
        this.tex,
        this.createdAt,
       });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    card = json['card'];
    userType = json['user_type'];
    gender = json['gender'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    phoneWithCode = json['phone_with_code'];
    email = json['email'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    tex = json['tex'];
    createdAt = json['created_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['card'] = this.card;
    data['user_type'] = this.userType;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['phonecode'] = this.phonecode;
    data['phone_with_code'] = this.phoneWithCode;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['is_active'] = this.isActive;
    data['tex'] = this.tex;
    data['created_at'] = this.createdAt;

    return data;
  }
}
