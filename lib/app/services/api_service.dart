import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:repo_up/app/data/model/api_response/api_response.dart';

class ApiService extends GetxService {
  Dio client = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));

  Future<ApiResponse<T>> get<T>(String path) async {
    try {
      var randomInt = Random().nextInt(100) % 3;
      if (randomInt == 0) {
        await Future.delayed(const Duration(seconds: 2));
        throw "API RANDOM ERROR";
      }
      var response = await client.get(path);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return ApiResponse.failed(e.message ?? "Dio error", e.error);
    } catch (e) {
      printError(info: e.toString());
      return ApiResponse.failed(e.toString(), e);
    }
  }

  Future<ApiResponse<T>> post<T>(String path, dynamic data) async {
    try {
      var response = await client.post(path, data: data);
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return ApiResponse.failed(e.message ?? "Dio error", e.error);
    } catch (e) {
      printError(info: e.toString());
      return ApiResponse.failed('Неизвестная ошибка', e);
    }
  }

  Future<ApiService> init() async {
    return this;
  }
}
