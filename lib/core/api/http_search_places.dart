import 'dart:convert';


import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../errors/exceptions.dart';


class HttpClient {
  static Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri uri = Uri.parse("${ApiConstants.baseUrlGoogleMaps}$endpoint");
    if (queryParameters != null) {
      Map<String, String> stringQueryParameters = queryParameters.map(
        (key, value) => MapEntry(key, value.toString()),
      );
      uri = uri.replace(queryParameters: stringQueryParameters);
    }
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(data);

        return jsonData;
      } else {
        throw NoInternetConnectionException();
      }
    } on http.ClientException {
      throw NoInternetConnectionException();
    }
  }
}
