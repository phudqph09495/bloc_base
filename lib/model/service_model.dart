class ServiceModel {
  int? code;
  String? message;
  List<Data>? data;

  ServiceModel({this.code, this.message, this.data});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? imageUrl;
  String? title;
  int? price;
  int? salePrice;
  double? star;
  int? comment;
  String? description;
  int? time;
  double? km;
  Null? tags;

  Data({this.salePrice,this.id, this.title, this.description, this.imageUrl, this.tags, this.comment, this.km, this.price, this.star, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
    price = json['price'];
    salePrice = json['sale_price'];
    star = json['star'];
    comment = json['comment'];
    description = json['description'];
    time = json['time'];
    km = json['km'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['title'] = title;
    data['price'] = price;
    data['sale_price'] = salePrice;
    data['star'] = star;
    data['comment'] = comment;
    data['description'] = description;
    data['time'] = time;
    data['km'] = km;
    data['tags'] = tags;
    return data;
  }
}
