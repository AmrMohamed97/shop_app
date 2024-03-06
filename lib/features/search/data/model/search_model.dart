
class GetSearchModel{
  bool? status;
  String? message;
  SearchModelData? searchResult;
  GetSearchModel.fromJson(Map<String,dynamic> json){
    status =json['status'];
    message =json['message'];
    searchResult =json['data'] != null?SearchModelData.fromJson(json['data']):null;
  }
}
class SearchModelData{
  int? currentPage;
  List<SearchData> products=[];
  dynamic total;
  SearchModelData.fromJson(Map<String,dynamic> json){
    currentPage=json['current_page'];
    json['data'].forEach((element)=>products.add(SearchData.fromJson(element)));
    total=json['total'];
  }
}
class SearchData{
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String> images=[];
  bool? inFavorite;
  bool? inCart;

  SearchData.fromJson(Map<String,dynamic> json){
    id =json['id'];
    price =json['price'];
    oldPrice =json['old_price'];
    discount =json['discount'];
    image =json['image'];
    name =json['name'];
    description =json['description'];
    json['images'].forEach((element)=>images.add(element));
    inFavorite =json['in_favorites'];
    inCart =json['in_cart'];
  }
}