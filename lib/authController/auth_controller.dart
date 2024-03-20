
// ignore_for_file: library_prefixes

import 'package:connectingtobackend/service/dio.dart';
import 'package:dio/dio.dart' as Dio;
  
   
   Future<Map> register(Map creds) async {
    
    try {
      Dio.Response response = await axios().post('/auth/register', data: creds);
        print(response);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }
