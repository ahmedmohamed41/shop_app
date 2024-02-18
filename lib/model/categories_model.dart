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
  List<DataModel1> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    json['data'].forEach((element) {
      data.add(
        DataModel1.fromJsom(element),
      );
    });
  }
}

class DataModel1 {
  int? id;
  String? name;
  String? image;

  DataModel1.fromJsom(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
