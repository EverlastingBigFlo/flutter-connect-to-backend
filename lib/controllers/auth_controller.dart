// ignore_for_file: library_prefixes

import 'package:connectingtobackend/service/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController {
  final container = ProviderContainer();

  Future<Map> register(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/register', data: creds);

      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> sendOtp(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/sendotp', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> checkOtp(Map creds) async {
    try {
      Dio.Response response = await axios().post('/auth/checkOtp', data: creds);
      print('Helllooooooooooooooooooooooooooo $response');
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }

  Future<Map> createTxPin(Map creds) async {
    try {
      Dio.Response response =
          await axios().post('/account/createtxpin', data: creds);
      return response.data;
    } on Dio.DioException catch (e) {
      return {'status': 'error', 'message': e.error};
    }
  }
}
