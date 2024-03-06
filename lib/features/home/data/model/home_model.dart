class HomeModel {
  bool? status;
  String? message;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data =  json['data'] !=null? HomeDataModel.fromJson(json['data']) : null ;
    //json['data'] !=null? data
  }
}
class HomeDataModel{
  List<BannerModel> banners=[];
  List<ProductModel> products=[];
  String? ad;
  HomeDataModel.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element){
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
    ad=json['ad'];
  }
}
class BannerModel{
  int? id;
  String? image;
  dynamic category;
  dynamic product;
  BannerModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    image=json['image'];
    category=json['category'];
    product=json['product'];
  }
}

class ProductModel{
  dynamic id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  List<String> images=[];
  bool? inFavorites;
  bool? inCart;
  ProductModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    description=json['description'];
    json['images'].forEach((element)=>images.add(element));
    // images=json['images'].cast<String>();
    inFavorites=json['in_favorites'];
    inCart=json['in_cart'];

  }
}