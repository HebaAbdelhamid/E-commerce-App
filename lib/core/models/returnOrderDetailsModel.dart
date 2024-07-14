class ReturnOrderDetailsModel {
  bool? status;
  Data? data;

  ReturnOrderDetailsModel({this.status, this.data});

  ReturnOrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Address? address;
  int? discount;
  int? grandTotal;
  int? subTotal;
  String? reason;
  List<Null>? images;
  String? statusKey;
  String? status;
  String? currency;
  String? createdAt;
  String? itemsCount;
  List<Items>? items;
  int? shippingFees;
  int? tex;
  String? company;
  String? companyId;
  String? representative;
  String? representativeId;
  int? orderId;
  int? actualShippingFees;
  String? whatsapp;
  String? name;
  String? phone;
  String? returnDate;
  String? orderDate;

  Data(
      {this.id,
        this.address,
        this.discount,
        this.grandTotal,
        this.subTotal,
        this.reason,
        this.images,
        this.statusKey,
        this.status,
        this.currency,
        this.createdAt,
        this.itemsCount,
        this.items,
        this.shippingFees,
        this.tex,
        this.company,
        this.companyId,
        this.representative,
        this.representativeId,
        this.orderId,
        this.actualShippingFees,
        this.whatsapp,
        this.name,
        this.phone,
        this.returnDate,
        this.orderDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    discount = json['discount'];
    grandTotal = json['grand_total'];
    subTotal = json['sub_total'];
    reason = json['reason'];

    statusKey = json['status_key'];
    status = json['status'];
    currency = json['currency'];
    createdAt = json['created_at'];
    itemsCount = json['items_count'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    shippingFees = json['shipping_fees'];
    tex = json['tex'];
    company = json['company'];
    companyId = json['company_id'];
    representative = json['representative'];
    representativeId = json['representative_id'];
    orderId = json['order_id'];
    actualShippingFees = json['actual_shipping_fees'];
    whatsapp = json['whatsapp'];
    name = json['name'];
    phone = json['phone'];
    returnDate = json['return_date'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['discount'] = this.discount;
    data['grand_total'] = this.grandTotal;
    data['sub_total'] = this.subTotal;
    data['reason'] = this.reason;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['currency'] = this.currency;
    data['created_at'] = this.createdAt;
    data['items_count'] = this.itemsCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['shipping_fees'] = this.shippingFees;
    data['tex'] = this.tex;
    data['company'] = this.company;
    data['company_id'] = this.companyId;
    data['representative'] = this.representative;
    data['representative_id'] = this.representativeId;
    data['order_id'] = this.orderId;
    data['actual_shipping_fees'] = this.actualShippingFees;
    data['whatsapp'] = this.whatsapp;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['return_date'] = this.returnDate;
    data['order_date'] = this.orderDate;
    return data;
  }
}

class Address {
  int? id;
  String? name;
  Null? postal;
  int? isDefault;
  String? nearestPlace;
  String? address;
  String? kind;
  String? kindKey;
  String? country;
  int? countryId;
  String? city;
  int? cityId;
  String? lat;
  String? lng;

  Address(
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
        this.lat,
        this.lng});

  Address.fromJson(Map<String, dynamic> json) {
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
    data['lat'] = this.lat;
    data['lng'] = this.lng;
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
  Null? quantityReturn;
  List<Null>? images;

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

    return data;
  }
}
