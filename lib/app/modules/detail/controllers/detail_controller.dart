import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  TabController? tabController;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(() {
      update();
      // idTab = tabController!.index;
    });
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
}
