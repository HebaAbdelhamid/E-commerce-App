class ShowProductModel {
  bool? status;
  Data? data;

  ShowProductModel({this.status, this.data});

  ShowProductModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? image;
  String? rate;
  String? statusKey;
  String? status;
  bool? isAvailable;
  bool? offer;
  Category? category;
  Brand? brand;
  int? price;
  int? priceAfterDiscount;
  String? currency;
  String? description;
  List<Segments>? segments;
  bool? isFavoured;
  List<Images>? images;
  int? productQuantity;

  Data(
      {this.id,
        this.name,
        this.image,
        this.rate,
        this.statusKey,
        this.status,
        this.isAvailable,
        this.offer,
        this.category,
        this.brand,
        this.price,
        this.priceAfterDiscount,
        this.currency,
        this.description,
        this.segments,
        this.isFavoured,
        this.images,
        this.productQuantity});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    rate = json['rate'];
    statusKey = json['status_key'];
    status = json['status'];
    isAvailable = json['is_available'];
    offer = json['offer'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
    currency = json['currency'];
    description = json['description'];
    if (json['segments'] != null) {
      segments = <Segments>[];
      json['segments'].forEach((v) {
        segments!.add(new Segments.fromJson(v));
      });
    }
    isFavoured = json['is_favoured'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['rate'] = this.rate;
    data['status_key'] = this.statusKey;
    data['status'] = this.status;
    data['is_available'] = this.isAvailable;
    data['offer'] = this.offer;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['price'] = this.price;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['currency'] = this.currency;
    data['description'] = this.description;
    if (this.segments != null) {
      data['segments'] = this.segments!.map((v) => v.toJson()).toList();
    }
    data['is_favoured'] = this.isFavoured;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['product_quantity'] = this.productQuantity;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? description;
  int? products;
  List<SubCategories>? subCategories;

  Category(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.products,
        this.subCategories});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    products = json['products'];
    if (json['sub_categories'] != null) {
      subCategories = <SubCategories>[];
      json['sub_categories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['products'] = this.products;
    if (this.subCategories != null) {
      data['sub_categories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  int? id;
  String? name;
  String? description;

  SubCategories({this.id, this.name, this.description});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? image;
  String? description;

  Brand({this.id, this.name, this.image, this.description});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}

class Segments {
  int? id;
  String? type;
  int? price;
  String? currency;
  int? priceAfterDiscount;

  Segments(
      {this.id, this.type, this.price, this.currency, this.priceAfterDiscount});

  Segments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    currency = json['currency'];
    priceAfterDiscount = json['price_after_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['price_after_discount'] = this.priceAfterDiscount;
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
