class ShopCategoriesModel {
  bool? status;

  CategoriesDataModel? data;

  ShopCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);
  }
}

class CategoriesDataModel {
  int? currentPage;
  List<DataModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((element) {
      data.add(DataModel.fromJsom(element),
    
      );
    });
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.fromJsom(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
