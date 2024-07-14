import '../addToCartModel.dart';

class CartItems {
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

  CartItems(
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

  CartItems.fromJson(Map<String, dynamic> json) {
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
