// config

import '../Model/app_config.dart';

// packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPServices {
  final Dio dio = Dio();
  final GetIt getit = GetIt.instance;

  String? _base_url;
  String? _api_key;

  HTTPServices() {
    AppConfig _context = getit.get<AppConfig>();
    _base_url = _context.BASE_API_URL;
    _api_key = _context.API_KEY;
  }

  Future<Response?> get(String _path,
      {required Map<String, dynamic> query}) async {
    try {
      String _url = '$_base_url$_path';
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'en-us',
      };
      if (query.isNotEmpty) {
        _query.addAll(query);
      }
      return await dio.get(_url, queryParameters: _query);
    } on DioException catch (e) {
      print('Unable to perform get request.');
      print('DioError: $e');
      return null; // Return null or handle the error as needed
    }
  }
}
