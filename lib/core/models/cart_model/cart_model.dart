import 'package:yiki1/core/models/cart_model/cart_data.dart';

class CartModel {
  bool? status;
  String? message;
  CartData? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new CartData.fromJson(json['data']) : null;
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


// class User {
//   int? id;
//   String? name;
//   String? card;
//   String? logo;
//   String? userType;
//   String? gender;
//   String? phone;
//   String? phonecode;
//   String? phoneWithCode;
//   String? email;
//   String? avatar;
//   int? isActive;
//   String? tex;
//   String? createdAt;
//   List<Null>? addresses;
//
//   User(
//       {this.id,
//         this.name,
//         this.card,
//         this.logo,
//         this.userType,
//         this.gender,
//         this.phone,
//         this.phonecode,
//         this.phoneWithCode,
//         this.email,
//         this.avatar,
//         this.isActive,
//         this.tex,
//         this.createdAt,
//         this.addresses});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     card = json['card'];
//     logo = json['logo'];
//     userType = json['user_type'];
//     gender = json['gender'];
//     phone = json['phone'];
//     phonecode = json['phonecode'];
//     phoneWithCode = json['phone_with_code'];
//     email = json['email'];
//     avatar = json['avatar'];
//     isActive = json['is_active'];
//     tex = json['tex'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['card'] = this.card;
//     data['logo'] = this.logo;
//     data['user_type'] = this.userType;
//     data['gender'] = this.gender;
//     data['phone'] = this.phone;
//     data['phonecode'] = this.phonecode;
//     data['phone_with_code'] = this.phoneWithCode;
//     data['email'] = this.email;
//     data['avatar'] = this.avatar;
//     data['is_active'] = this.isActive;
//     data['tex'] = this.tex;
//     data['created_at'] = this.createdAt;
//
//     return data;
//   }
// }
