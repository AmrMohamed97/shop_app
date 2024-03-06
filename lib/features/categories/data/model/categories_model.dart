class CategoriesModel{
  bool? status;
  String? message;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    message=json['message'];
    data=json['data'] != null ? CategoriesDataModel.fromJson(json['data']) :null;
  }
}
class CategoriesDataModel{
  int? currentPage;
  List<BuildDataModel> data=[];
  int? total;
  CategoriesDataModel.fromJson(Map<String,dynamic> json){
    currentPage=json['current_page'];
    json['data'].forEach((element)=>data.add(BuildDataModel.fromJson(element)));
    total=json['total'];
  }
}
class BuildDataModel{
  int? id;
  String? name;
  String? image;
  BuildDataModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}