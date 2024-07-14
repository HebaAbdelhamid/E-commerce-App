class ProfileModel {
  bool? status;
  Data? data;

  ProfileModel({this.status, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;
  Null? message;

  Data({this.user, this.token, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['message'] = this.message;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userType;
  Null? branchCount;
  Null? companyName;
  String? logo;
  String? card;
  String? phone;
  String? phonecode;
  String? gender;
  String? avatar;
  int? point;
  int? valPoint;
  int? isActive;
  int? isVerified;
  int? notificationCount;
  String? email;
  int? wallet;
  Null? googleId;
  Null? branchId;
  String? tex;
  int? notifications;

  User(
      {this.id,
        this.name,
        this.userType,
        this.branchCount,
        this.companyName,
        this.logo,
        this.card,
        this.phone,
        this.phonecode,
        this.gender,
        this.avatar,
        this.point,
        this.valPoint,
        this.isActive,
        this.isVerified,
        this.notificationCount,
        this.email,
        this.wallet,
        this.googleId,
        this.branchId,
        this.tex,
        this.notifications});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    branchCount = json['branch_count'];
    companyName = json['company_name'];
    logo = json['logo'];
    card = json['card'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    gender = json['gender'];
    avatar = json['avatar'];
    point = json['point'];
    valPoint = json['val_point'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    notificationCount = json['notification_count'];
    email = json['email'];
    wallet = json['wallet'];
    googleId = json['google_id'];
    branchId = json['branch_id'];
    tex = json['tex'];
    notifications = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_type'] = this.userType;
    data['branch_count'] = this.branchCount;
    data['company_name'] = this.companyName;
    data['logo'] = this.logo;
    data['card'] = this.card;
    data['phone'] = this.phone;
    data['phonecode'] = this.phonecode;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['point'] = this.point;
    data['val_point'] = this.valPoint;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['notification_count'] = this.notificationCount;
    data['email'] = this.email;
    data['wallet'] = this.wallet;
    data['google_id'] = this.googleId;
    data['branch_id'] = this.branchId;
    data['tex'] = this.tex;
    data['notifications'] = this.notifications;
    return data;
  }
}
