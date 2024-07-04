class UserModel {
  bool? status;
  UserData? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  User? user;
  String? token;
  int? deviceId;

  UserData({this.user, this.token, this.deviceId});

  UserData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['device_id'] = deviceId;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userType;
  String? phone;
  String? phonecode;
  String? gender;
  String? avatar;
  String? point;
  String? valPoint;
  int? isActive;
  int? isVerified;
  int? notificationCount;
  String? email;
  int? wallet;
  String? tex;
  int? notifications;

  User(
      {this.id,
      this.name,
      this.userType,
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
      this.tex,
      this.notifications});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userType = json['user_type'];
    phone = json['phone'];
    phonecode = json['phonecode'];
    gender = json['gender'];
    avatar = json['avatar'];
    point = json['point']?.toString();
    valPoint = json['val_point']?.toString();
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    notificationCount = json['notification_count'];
    email = json['email'];
    wallet = json['wallet'];
    tex = json['tex']?.toString();
    notifications = json['notifications'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_type'] = userType;
    data['phone'] = phone;
    data['phonecode'] = phonecode;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['point'] = point;
    data['val_point'] = valPoint;
    data['is_active'] = isActive;
    data['is_verified'] = isVerified;
    data['notification_count'] = notificationCount;
    data['email'] = email;
    data['wallet'] = wallet;
    data['tex'] = tex;
    data['notifications'] = notifications;
    return data;
  }
}
