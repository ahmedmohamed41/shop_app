class ShopLoginModel {
  bool? status;
  String? message;
  UserLoginData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserLoginData.fromJson(json['data']) : null;
  }
}

class UserLoginData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

// named constructor
  UserLoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}

class ShopRegisterModel {
  bool? status;
  String? message;
  UserRegisterData? data;

  ShopRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? UserRegisterData.fromJson(json['data']) : null;
  }
}

class UserRegisterData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

// named constructor
  UserRegisterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
