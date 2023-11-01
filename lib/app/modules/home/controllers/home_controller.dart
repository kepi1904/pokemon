import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/services.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<PokemonModel> datalist = <PokemonModel>[].obs;
  final PokemonRepository dataRepo = PokemonServices();
  String response = '';
  RxBool responLogic = false.obs;
  List urlImage = [];
  List netWorkImage = [].obs;
  List types = [].obs;
  List species = [].obs;
  List height = [].obs;
  List weight = [].obs;
  List abilities = [].obs;
  List gender = [].obs;
  List eggGroups = [].obs;
  List eggCycle = [].obs;

  Color? imageDominantColor;
  late ScrollController controllers;
  final isScroll = false.obs;
  int a = 10;
  String page = "10";
  late int length;
  @override
  void onInit() {
    length = 10;
    controllers = ScrollController();

    controllers.addListener(() {
      if (controllers.hasClients) {
        if (controllers.position.maxScrollExtent == controllers.offset) {
          isScroll.value = true;
          update();

          a++;
          page = '${a + 10}';
          Get.snackbar(
            "Loadmore",
            "Please Wait!",
            snackPosition: SnackPosition.BOTTOM,
          );
          Timer(const Duration(seconds: 1), () {
            isScroll.value = false;
            getLoad(page);
            update();
          });
        } else {
          update();
          isScroll.value = false;
        }
      }
    });
    getPackage("10");
    update();
    super.onInit();
  }

  @override
  void onReady() {
    update();
    super.onReady();
  }

  @override
  void onClose() {
    update();
    super.onClose();
  }

  responseData(String data) {
    responLogic.value = true;
    update();
    datalist.value = [];
    response = data.toString();
    Get.snackbar(
      "Tidak ada data",
      response,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.yellow,
      icon: const Icon(Icons.warning),
    );
  }

  getLoad(String pageNum) async {
    update();

    final res = await dataRepo.getData(pageNum: pageNum);
    try {
      update();

      if (res!.isEmpty) {
        responLogic.value = true;
        datalist.value = [];

        update();
      } else {
        // ignore: invalid_use_of_protected_member
        datalist.value.addAll(res);
        for (int i = 0; i < datalist.length; i++) {
          debugPrint(datalist[i].url.toString());
          urlImage.add(datalist[i].url.toString());
        }
        getImage();
        update();
      }

      update();
    } catch (e) {
      update();
    }
  }

  getPackage(String pageNum) async {
    update();

    final res = await dataRepo.getData(pageNum: pageNum);
    try {
      update();

      if (res!.isEmpty) {
        responLogic.value = true;
        datalist.value = [];

        update();
      } else {
        datalist.value = res;
        for (int i = 0; i < datalist.length; i++) {
          debugPrint(datalist[i].url.toString());
          urlImage.add(datalist[i].url.toString());
        }
        getImage();
        update();
      }

      update();
    } catch (e) {
      update();
    }
  }

  getImage() async {
    try {
      for (String image in urlImage) {
        final response = await http.get(Uri.parse(image), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

        update();

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          netWorkImage.add(data["sprites"]["other"]["home"]["front_shiny"]);

          types.add(data["types"][0]["type"]["name"]);
          species.add(data["species"]["name"]);
          height.add(data["height"]);
          weight.add(data["weight"]);
          abilities.add(data["abilities"][0]["ability"]["name"]);

          imageDominantColor =
              await getImagePalette(data["sprites"]["front_default"]);

          update();
        } else {
          Get.snackbar(
            "Gagal",
            "Gagal ambil gambar",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            icon: const Icon(Icons.warning),
          );
        }
      }
    } catch (e) {
      update();
    }
  }

  Future<Color> getImagePalette(String imagePath) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
            Image.network(imagePath).image);

    // Ambil warna dominan dari gambar
    Color dominantColor = paletteGenerator.dominantColor!.color;

    return dominantColor;
  }
}
