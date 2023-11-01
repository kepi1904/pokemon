import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon/app/core/values/app_assets.dart';
import 'package:pokemon/app/core/values/app_color.dart';
import 'package:pokemon/app/core/values/app_sizes.dart';
import 'package:pokemon/app/core/values/app_string.dart';
import 'package:pokemon/app/core/widgets/shimmer_loading.dart';
import 'package:pokemon/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.kBlueDark,
          onPressed: () {},
          child: const Icon(Icons.tune),
        ),
        body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
                right: 1,
                left: 1,
                top: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.format_list_bulleted))
                  ],
                )),
            const Positioned(
                top: 90,
                left: 15,
                child: Text(
                  Labels.pokedex,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                )),
            Positioned(
                top: -55,
                right: -170,
                child: SizedBox(
                    height: 240,
                    child: Image.asset(
                      AppAsset.icBall,
                      color: Colors.grey.withOpacity(0.2),
                    ))),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.only(top: 120, left: 10, right: 10),
              // implement GridView.builder
              child: Obx(() => controller.netWorkImage.length >= 10
                  ? GridView.builder(
                      controller: controller.controllers,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: controller.datalist.length,
                      itemBuilder: (BuildContext ctx, index) {
                        Color itemColor;
                        if (index % 3 == 0) {
                          itemColor = const Color.fromARGB(255, 27, 175, 152)
                              .withOpacity(0.5);
                        } else if (index % 3 == 1) {
                          itemColor = const Color.fromARGB(172, 244, 54, 54);
                        } else if (index % 3 == 2) {
                          itemColor = const Color.fromARGB(255, 255, 206, 59);
                        } else {
                          itemColor = Colors.blue;
                        }

                        return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: itemColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: ListTile(
                              title: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.datalist[index].name
                                            .toString()
                                            .capitalizeFirst
                                            .toString(),
                                        style: const TextStyle(
                                            color: AppColor.kWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      gapH4,
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color:
                                              AppColor.kWhite.withOpacity(0.5),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50)),
                                        ),
                                        child: Text(
                                          controller.types[index]
                                              .toString()
                                              .capitalizeFirst
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColor.kWhite,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: AppColor.kWhite.withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                      child: SizedBox(
                                        height: 50,
                                        child: Obx(
                                          () => controller
                                                  .netWorkImage.isNotEmpty
                                              ? Image.network(
                                                  controller
                                                      .netWorkImage[index],
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    AppAsset.imgNodata,
                                                    fit: BoxFit.cover,
                                                  );
                                                })
                                              : const Text("Loading"),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Get.toNamed(Routes.detail, arguments: [
                                  itemColor,
                                  controller.netWorkImage[index],
                                  controller.datalist[index].name
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  controller.types[index]
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  index,
                                  controller.species[index]
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  controller.height[index]
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  controller.weight[index]
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                  controller.abilities[index]
                                      .toString()
                                      .capitalizeFirst
                                      .toString(),
                                ]);
                              },
                            ));
                      })
                  : controller.responLogic.isTrue
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(AppAsset.imgNodata)),
                              gapH16,
                              const Text("Tidak ada data")
                            ],
                          ),
                        )
                      : const ShimmerLoading()),
            )),
          ]),
        ));
  }
}
