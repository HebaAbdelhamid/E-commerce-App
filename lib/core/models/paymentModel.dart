class PaymentModel {
  bool? status;
  String? message;
  Data? data;

  PaymentModel({this.status, this.message, this.data});

  PaymentModel.fromJson(Map<String, dynamic> json) {
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
  Null? paymentUrl;

  Data({this.order, this.paymentUrl});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    paymentUrl = json['payment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    data['payment_url'] = this.paymentUrl;
    return data;
  }
}

class Order {
  int? id;
  String? address;
  String? lng;
  String? lat;
  int? grandTotal;
  int? grandTotalAfterDeposit;
  String? sourceKey;
  String? source;
  Null? shippingFees;
  bool? dayReturns;
  int? cashback;
  int? tex;
  String? status;
  String? currency;
  String? paymentMethod;
  String? statusKey;
  int? productsCount;
  int? onePaice;
  bool? rateExists;
  int? rate;
  String? date;
  String? whatsapp;
  String? name;
  Null? branchId;
  Null? branchName;
  String? phone;
  String? dateCanceled;
  int? couponValue;
  String? coupon;
  AddressAll? addressAll;
  User? user;

  Order(
      {this.id,
        this.address,
        this.lng,
        this.lat,
        this.grandTotal,
        this.grandTotalAfterDeposit,
        this.sourceKey,
        this.source,
        this.shippingFees,
        this.dayReturns,
        this.cashback,
        this.tex,
        this.status,
        this.currency,
        this.paymentMethod,
        this.statusKey,
        this.productsCount,
        this.onePaice,
        this.rateExists,
        this.rate,
        this.date,
        this.whatsapp,
        this.name,
        this.branchId,
        this.branchName,
        this.phone,
        this.dateCanceled,
        this.couponValue,
        this.coupon,
        this.addressAll,
        this.user});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    lng = json['lng'];
    lat = json['lat'];
    grandTotal = json['grand_total'];
    grandTotalAfterDeposit = json['grand_total_after_deposit'];
    sourceKey = json['source_key'];
    source = json['source'];
    shippingFees = json['shipping_fees'];
    dayReturns = json['day_returns'];
    cashback = json['cashback'];
    tex = json['tex'];
    status = json['status'];
    currency = json['currency'];
    paymentMethod = json['payment_method'];
    statusKey = json['status_key'];
    productsCount = json['products_count'];
    onePaice = json['one_paice'];
    rateExists = json['rate_exists'];
    rate = json['rate'];
    date = json['date'];
    whatsapp = json['whatsapp'];
    name = json['name'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    phone = json['phone'];
    dateCanceled = json['date_canceled'];
    couponValue = json['coupon_value'];
    coupon = json['coupon'];
    addressAll = json['address_all'] != null
        ? new AddressAll.fromJson(json['address_all'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['grand_total'] = this.grandTotal;
    data['grand_total_after_deposit'] = this.grandTotalAfterDeposit;
    data['source_key'] = this.sourceKey;
    data['source'] = this.source;
    data['shipping_fees'] = this.shippingFees;
    data['day_returns'] = this.dayReturns;
    data['cashback'] = this.cashback;
    data['tex'] = this.tex;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['payment_method'] = this.paymentMethod;
    data['status_key'] = this.statusKey;
    data['products_count'] = this.productsCount;
    data['one_paice'] = this.onePaice;
    data['rate_exists'] = this.rateExists;
    data['rate'] = this.rate;
    data['date'] = this.date;
    data['whatsapp'] = this.whatsapp;
    data['name'] = this.name;
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    data['phone'] = this.phone;
    data['date_canceled'] = this.dateCanceled;
    data['coupon_value'] = this.couponValue;
    data['coupon'] = this.coupon;
    if (this.addressAll != null) {
      data['address_all'] = this.addressAll!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class AddressAll {
  int? id;
  String? name;
  Null? postal;
  int? isDefault;
  Null? nearestPlace;
  String? address;
  String? kind;
  String? kindKey;
  String? country;
  int? countryId;
  String? city;
  int? cityId;
  Null? shippingFees;
  String? lat;
  String? lng;

  AddressAll(
      {this.id,
        this.name,
        this.postal,
        this.isDefault,
        this.nearestPlace,
        this.address,
        this.kind,
        this.kindKey,
        this.country,
        this.countryId,
        this.city,
        this.cityId,
        this.shippingFees,
        this.lat,
        this.lng});

  AddressAll.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    postal = json['postal'];
    isDefault = json['is_default'];
    nearestPlace = json['nearest_place'];
    address = json['address'];
    kind = json['kind'];
    kindKey = json['kind_key'];
    country = json['country'];
    countryId = json['country_id'];
    city = json['city'];
    cityId = json['city_id'];
    shippingFees = json['shipping_fees'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['postal'] = this.postal;
    data['is_default'] = this.isDefault;
    data['nearest_place'] = this.nearestPlace;
    data['address'] = this.address;
    data['kind'] = this.kind;
    data['kind_key'] = this.kindKey;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['city'] = this.city;
    data['city_id'] = this.cityId;
    data['shipping_fees'] = this.shippingFees;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? card;
  String? logo;
  Null? branchCount;
  Null? companyName;
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
  List<Addresses>? addresses;

  User(
      {this.id,
        this.name,
        this.card,
        this.logo,
        this.branchCount,
        this.companyName,
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
        this.addresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    card = json['card'];
    logo = json['logo'];
    branchCount = json['branch_count'];
    companyName = json['company_name'];
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
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['card'] = this.card;
    data['logo'] = this.logo;
    data['branch_count'] = this.branchCount;
    data['company_name'] = this.companyName;
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
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  int? id;
  String? placeName;
  String? kind;
  Null? nearestPlace;
  String? address;
  String? lat;
  String? lng;
  int? isDefault;
  Country? country;
  Country? city;

  Addresses(
      {this.id,
        this.placeName,
        this.kind,
        this.nearestPlace,
        this.address,
        this.lat,
        this.lng,
        this.isDefault,
        this.country,
        this.city});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    placeName = json['place_name'];
    kind = json['kind'];
    nearestPlace = json['nearest_place'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    isDefault = json['is_default'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new Country.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place_name'] = this.placeName;
    data['kind'] = this.kind;
    data['nearest_place'] = this.nearestPlace;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['is_default'] = this.isDefault;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
