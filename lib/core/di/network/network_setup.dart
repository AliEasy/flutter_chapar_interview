import 'package:dio/dio.dart';
import 'package:flutter_chapar_interview/core/common/constants/network.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkSetup {
  @singleton
  Dio get authDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    return dio;
  }
}
