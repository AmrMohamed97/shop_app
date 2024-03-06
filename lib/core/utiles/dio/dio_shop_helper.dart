import 'package:dio/dio.dart';

class DioShopHelper {
  static Dio? dioShop ;

  static void init(){
    dioShop =Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url ,
    Map<String,dynamic>? queryParameter  ,
    String? lang ,
    String? token ,
  })async{
    dioShop!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dioShop!.get(url , queryParameters: queryParameter );
  }
  static Future<Response> postData ({
    required String url ,
    Map<String , dynamic>? queryParameter,
    required Map<String,dynamic> data,
    String? token,
    String? lang,
})async{
    dioShop!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dioShop!.post(url ,queryParameters: queryParameter ,data: data);
  }
  static Future<Response> putData ({
    required String url ,
    Map<String , dynamic>? queryParameter,
    required Map<String,dynamic> data,
    String? token,
    String? lang,
  })async{
    dioShop!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token,
    };
    return await dioShop!.put(url ,queryParameters: queryParameter ,data: data);
  }
}