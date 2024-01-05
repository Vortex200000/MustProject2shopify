import 'package:dio/dio.dart';
import 'package:mustproject2shopify2/core/utils/Constants.dart';

class ApiManager{

Dio dio = Dio();

  Future<Response>getData({ required String endpoint , Map<String , dynamic> ? data , String? Token}){
     
     return dio.get(Constants.baseUrl + endpoint , queryParameters: data , options: Options(headers: {"token":Token}));
     
   }

Future<Response>postData({ required String endpoint , Map<String , dynamic> ? body , String? Token}){

  return dio.post(Constants.baseUrl + endpoint , data:  body , options: Options(headers:{"token":Token} ));

}

Future<Response>removeData({ required String endpoint , Map<String , dynamic> ? body , String? Token}){

  return dio.delete(Constants.baseUrl + endpoint , data:  body , options: Options(headers:{"token":Token} ));

}

}