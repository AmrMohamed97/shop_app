class GetFavoriteModel{
  bool? status;
  String? message;
  FavoriteModelData? favData;
  GetFavoriteModel.fromJson(Map<String,dynamic> json){
    status =json['status'];
    message =json['message'];
    favData =json['data'] != null?FavoriteModelData.fromJson(json['data']):null;
  }
}
class FavoriteModelData{
  int? currentPage;
  List<FavoriteData> data=[];
  int? total;
  FavoriteModelData.fromJson(Map<String,dynamic> json){
    currentPage=json['current_page'];
    json['data'].forEach((element)=>data.add(FavoriteData.fromJson(element)));
    total=json['total'];
  }
}
class FavoriteData {
  dynamic id;
  FavoriteProduct? product;
  FavoriteData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    product =json['product'] != null?FavoriteProduct.fromJson(json['product']):null;
  }
}
class FavoriteProduct{
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  FavoriteProduct.fromJson(Map<String,dynamic> json){
    id =json['id'];
    price =json['price'];
    oldPrice =json['old_price'];
    discount =json['discount'];
    image =json['image'];
    name =json['name'];
    description =json['description'];
  }
}