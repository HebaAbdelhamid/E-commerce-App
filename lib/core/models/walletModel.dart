class WalletModel {
  bool? status;
  Data? data;

  WalletModel({this.status, this.data});

  WalletModel.fromJson(Map<String, dynamic> json) {
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
  String? wallet;
  int? points;

  Data({this.wallet, this.points});

  Data.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet'] = this.wallet;
    data['points'] = this.points;
    return data;
  }
}
