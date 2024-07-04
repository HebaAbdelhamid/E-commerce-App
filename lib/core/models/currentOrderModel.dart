// class CurrentOrderModel {
//   Data? data;
//
//   CurrentOrderModel({this.data,  });
//
//   CurrentOrderModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//
//
//     return data;
//   }
// }
//
// class Data {
//   List<Null>? items;
//   Paginate? paginate;
//   Null? extra;
//
//   Data({this.items, this.paginate, this.extra});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['items'] != null) {
//       items = <Null>[];
//       json['items'].forEach((v) {
//         items!.add(new Null.fromJson(v));
//       });
//     }
//     paginate = json['paginate'] != null
//         ? new Paginate.fromJson(json['paginate'])
//         : null;
//     extra = json['extra'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     if (this.paginate != null) {
//       data['paginate'] = this.paginate!.toJson();
//     }
//     data['extra'] = this.extra;
//     return data;
//   }
// }
//
// class Paginate {
//   int? total;
//   int? count;
//   int? perPage;
//   String? nextPageUrl;
//   String? prevPageUrl;
//   int? currentPage;
//   int? totalPages;
//
//   Paginate(
//       {this.total,
//         this.count,
//         this.perPage,
//         this.nextPageUrl,
//         this.prevPageUrl,
//         this.currentPage,
//         this.totalPages});
//
//   Paginate.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     count = json['count'];
//     perPage = json['per_page'];
//     nextPageUrl = json['next_page_url'];
//     prevPageUrl = json['prev_page_url'];
//     currentPage = json['current_page'];
//     totalPages = json['total_pages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['count'] = this.count;
//     data['per_page'] = this.perPage;
//     data['next_page_url'] = this.nextPageUrl;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['current_page'] = this.currentPage;
//     data['total_pages'] = this.totalPages;
//     return data;
//   }
// }
//
//
//
//
