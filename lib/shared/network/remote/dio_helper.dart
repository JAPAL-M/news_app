import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static Future<Response> getData({
  @required String? url,
  @required Map<String,dynamic>? query,
})async{
   return await dio!.get(url!,queryParameters: query);
  }
}

//ApiKey: apiKey=d4eafed50c2040d7bdc5d3a186533579
//BaseUrl: https://newsapi.org/
// method: v2/top-headlines?
// query: country=de&category=business&