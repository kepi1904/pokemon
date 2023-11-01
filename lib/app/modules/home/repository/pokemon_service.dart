import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

import 'package:pokemon/app/modules/home/controllers/home_controller.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

import '../../../data/networks/base_response.dart';
import '../../../data/networks/network_dio.dart';

import 'pokemon_repository.dart';

class PokemonServices extends PokemonRepository {
  Dio get _dio => NetworkDio.createDio(needAuth: true);

  @override
  Future<List<PokemonModel>?> getData({String? pageNum}) async {
    try {
      Response response = await _dio.get(
        '/pokemon?limit=$pageNum&offset=0',
      );
      final resp = BaseResponseApi.fromJson(
          jsonDecode(response.toString()) as Map<String, dynamic>);

      // ignore: unnecessary_null_comparison
      if (resp != null) {
        final listData = (resp.data as List)
            .map((e) => PokemonModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return listData;
      } else {
        return [];
      }
    } on DioError catch (e) {
      // ignore: unnecessary_type_check
      if (e is DioError) {
        HomeController controller = Get.put(HomeController());
        if (e.response != null) {
          var dat = jsonDecode(e.response.toString());
          var res = dat['message'];
          controller.responseData(res);
          controller.update();
        } else {
          Get.snackbar("Error", "${e.response}");

          // Lakukan sesuatu jika tidak ada response yang diterima
        }
      } else {
        Get.snackbar("Error", "$e");

        // Tangani jenis error lainnya
      }
      BaseResponseApi error =
          BaseResponseApi.fromJson(jsonDecode(e.response!.data));
      throw '$error';
    }
  }
}
