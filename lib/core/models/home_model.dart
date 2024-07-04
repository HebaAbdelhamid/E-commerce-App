class HomeModel {
  bool? status;
  Data? data;

  HomeModel({this.status, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<Null>? addresses;
  List<Banners>? banners;
  List<Categories>? categories;
  Products? products;
  Products? offers;

  String? email;
  List<String>? address;
  List<String>? numbers;
  String? androidStoreLink;
  String? appleStoreLink;
  String? footer;

  Data(
      {this.addresses,
        this.banners,
        this.categories,
        this.products,
        this.offers,


        this.email,
        this.address,
        this.numbers,
        this.androidStoreLink,
        this.appleStoreLink,
        this.footer});

  Data.fromJson(Map<String, dynamic> json) {

    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    offers =
    json['offers'] != null ? new Products.fromJson(json['offers']) : null;

    email = json['email'];
    address = json['address'].cast<String>();
    numbers = json['numbers'].cast<String>();
    androidStoreLink = json['android_store_link'];
    appleStoreLink = json['apple_store_link'];
    footer = json['footer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }

    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.offers != null) {
      data['offers'] = this.offers!.toJson();
    }


    data['email'] = this.email;
    data['address'] = this.address;
    data['numbers'] = this.numbers;

    return data;
  }
}

class Banners {
  int? id;
  String? title;
  Null? category;
  String? image;
  String? description;

  Banners({this.id, this.title, this.category, this.image, this.description});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}


class Categories {
  int? id;
  String? name;
  String? image;
  String? description;
  int? products;

  Categories(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.products,
       });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    products = json['products'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['products'] = this.products;

    return data;
  }
}


class Products {
  List<Items>? items;
  Paginate? paginate;

  Products({this.items, this.paginate, });

  Products.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    paginate = json['paginate'] != null
        ? new Paginate.fromJson(json['paginate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.paginate != null) {
      data['paginate'] = this.paginate!.toJson();
    }
    return data;
  }
}

class Items {
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

  Items(
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

  Items.fromJson(Map<String, dynamic> json) {
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

class Paginate {
  int? total;
  int? count;
  int? perPage;
  String? nextPageUrl;
  String? prevPageUrl;
  int? currentPage;
  int? totalPages;

  Paginate(
      {this.total,
        this.count,
        this.perPage,
        this.nextPageUrl,
        this.prevPageUrl,
        this.currentPage,
        this.totalPages});

  Paginate.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['next_page_url'] = this.nextPageUrl;
    data['prev_page_url'] = this.prevPageUrl;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

