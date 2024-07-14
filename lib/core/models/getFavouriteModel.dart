class GetFavouriteModel {
  bool? status;
  Data? data;

  GetFavouriteModel({this.status, this.data});

  GetFavouriteModel.fromJson(Map<String, dynamic> json) {
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
  List<Products>? products;

  Data({this.products});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? image;
  String? statusKey;
  String? status;
  bool? isAvailable;
  String? rate;
  bool? offer;
  int? price;
  int? priceAfterDiscount;
  String? currency;
  bool? isFavoured;

  Products(
      {this.id,
        this.name,
        this.image,
        this.statusKey,
        this.status,
        this.isAvailable,
        this.rate,
        this.offer,
        this.price,
        this.priceAfterDiscount,
        this.currency,
        this.isFavoured});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    statusKey = json['status_key'];
    status = json['status'];
    isAvailable = json['is_available'];
    rate = json['rate'];
    offer = json['offer'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    currency = json['currency'];
    isFavoured = json['is_favoured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['is_available'] = this.isAvailable;
    data['rate'] = this.rate;
    data['offer'] = this.offer;
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['currency'] = this.currency;
    data['is_favoured'] = this.isFavoured;
    return data;
  }
}
