import 'package:dio/dio.dart';

final dio = Dio();


// Dio axios() {
//   dio.get('http://10.0.2.2:8000/api/hello');
// }

Future<Response<dynamic>> axios() async {
  return await dio.get('http://10.0.2.2:8000/api/hello');
}