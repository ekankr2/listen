import 'package:get/get.dart';

class ApiService extends GetxService {
  final String baseUrl = 'https://';
  final GetConnect _connect = GetConnect();

  Future<Response> get(String path) async {
    try {
      final response = await _connect.get('$baseUrl$path');
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _connect.post('$baseUrl$path', data);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
}