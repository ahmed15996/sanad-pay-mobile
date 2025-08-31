import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import '../../sanad_app.dart';
import '../constants/api_constants.dart';
import '../constants/app_cached.dart';
import '../constants/app_constants.dart';
import '../errors/exceptions.dart';
import '../local/shared_preferences/shared_pref_services.dart';
import '../util/routing/routes.dart';
import '../widgets/custom_login_expired_dialog.dart';
import 'api_consumer.dart';
import 'api_status_codes.dart';
import 'base_response.dart';
import 'network_info.dart';

@LazySingleton(as: ApiConsumer)
class DioApiConsumer extends ApiConsumer {
  final Dio dioClient;
  final NetworkInfo networkInfo;
  final SharedPrefServices appPref;

  DioApiConsumer({
    required this.networkInfo,
    required this.dioClient,
    required this.appPref,
  }) {
    /// Fix for dio handshake error
    (dioClient.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final dioClient = HttpClient();
      dioClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return dioClient;
    };

    /// dio validation
    dioClient.options
      ..baseUrl = ApiConstants.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < ApiStatusCodes.internalServerError;
      };

    /// Debug Interceptors
    dioClient.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
    ));
  }

  Map<String, dynamic> getHeaders({String? sendToken}) {
    String lang = appPref.getData(key: AppCached.lang);
    String token = appPref.getData(key: AppCached.token) ?? "";
    if (token.isNotEmpty) {
      return {
        'Accept': 'application/json',
        'lang': lang,
        "app-api-key": AppConstants.apiKey,
        'Authorization': 'Bearer $token'
      };
    } else {
      return {
        'Accept': 'application/json',
        'lang': lang,
        "app-api-key": AppConstants.apiKey,
        if (sendToken != null) 'Authorization': 'Bearer $sendToken'
      };
    }
  }

  @override
  Future get(
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    String? token
  }) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final Response response = await dioClient.get(
          endPoint,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(headers: getHeaders(sendToken: token)),
        );
        return handleResponseOnly(response: response);
      } on DioException catch (error) {
        return _handelDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  @override
  Future post(
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
    String? token,
  }) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final Response response = await dioClient.post(
          endPoint,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(headers: getHeaders(sendToken: token)),
        );
        return handleResponseOnly(response: response);
      } on DioException catch (error) {
        return _handelDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  @override
  Future delete(
      String endPoint, {
        dynamic body,
        Map<String, dynamic>? queryParameters,
        bool formDataIsEnabled = false,
        String? token,
      }) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final Response response = await dioClient.delete(
          endPoint,
          queryParameters: queryParameters,
          data: formDataIsEnabled ? FormData.fromMap(body!) : body,
          options: Options(headers: getHeaders(sendToken: token)),
        );
        return handleResponseOnly(response: response);
      } on DioException catch (error) {
        return _handelDioError(error: error);
      }
    } else {
      throw NoInternetConnectionException();
    }
  }

  handleResponseOnly({required Response response}) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return _handleResponseAsJson(response: response);
    } else if (response.statusCode == 422 ||
        response.statusCode == 400 ||
        response.statusCode == 403) {
      return _handleResponseAsJson(response: response);
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 401 || response.statusCode == 402) {
      clearDataUser();
      final decodedData = jsonDecode(response.data);
      throw ServerErrorException(decodedData['message']);
    } else if (response.statusCode == 500 ||
        response.statusCode == 307 ||
        response.statusCode == 504) {
      throw ServerErrorException();
    }
  }

  void clearDataUser() {
    try {
      Future.wait([
        appPref.removeData(key: AppCached.token),
      ]);
      handleResponse401();
    } catch (error) {
      throw ServerErrorException();
    }
  }

  Future handleResponse401() {
    final context = SanadApp.appNavigatorKey.currentState!.context;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        Future.delayed(const Duration(seconds: 3), () {
          if (context.mounted) {
            context.pushAndRemoveUntilWithNamed(
              Routes.loginView,
            );
          }
        });
        return const CustomLoginExpiredDialog();
      },
    );
  }

  BaseResponse _handleResponseAsJson({required Response<dynamic> response}) {
    final responseJson = jsonDecode(response.data.toString());
    return BaseResponse.fromJson(responseJson);
  }

  dynamic _handelDioError({required DioException error}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw TimeOutException();
      case DioExceptionType.connectionError:
        throw NoInternetConnectionException();
      case DioExceptionType.sendTimeout:
        throw TimeOutException();
      case DioExceptionType.receiveTimeout:
        throw TimeOutException();
      case DioExceptionType.badResponse:
        if (error.response!.statusCode == ApiStatusCodes.notFound) {
          throw NotFoundException();
        } else if (error.response!.statusCode == ApiStatusCodes.unauthorized ||
            error.response!.statusCode == 402) {
          clearDataUser();
          throw ServerErrorException();
        } else if (error.response!.statusCode == ApiStatusCodes.internalServerError ||
            error.response!.statusCode == 307 ||
            error.response!.statusCode == 504) {
          throw ServerErrorException();
        }
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw UnKnownException();
    }
  }
}
