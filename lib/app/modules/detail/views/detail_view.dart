import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokemon/app/core/values/app_assets.dart';
import 'package:pokemon/app/core/values/app_color.dart';
import 'package:pokemon/app/core/values/app_sizes.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Get.arguments[0],
      child: Stack(
        children: [
          Positioned(
              right: 1,
              left: 1,
              top: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColor.kWhite,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_outline,
                          color: AppColor.kWhite))
                ],
              )),
          Positioned(
              top: 120,
              left: 20,
              child: Text(
                Get.arguments[2],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23),
              )),
          Positioned(
              top: 160,
              left: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColor.kWhite.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Text(
                      Get.arguments[3],
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  gapW4,
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppColor.kWhite.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Text(
                      Get.arguments[3],
                      style: const TextStyle(
                          fontSize: 12,
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  gapW170,
                  gapW70,
                  Text(
                    "#00${Get.arguments[4]}",
                    style: const TextStyle(color: AppColor.kWhite),
                  )
                ],
              )),
          Positioned(
              top: 210,
              right: -130,
              child: SizedBox(
                  height: 240,
                  child: Image.asset(
                    AppAsset.icBall,
                    color: AppColor.kWhite.withOpacity(0.5),
                  ))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        gapH40,
                        Padding(
                          padding: const EdgeInsets.all(Sizes.p5),
                          child: TabBar(
                            indicatorColor: AppColor.kBlack.withOpacity(0.5),
                            isScrollable: true,
                            controller: controller.tabController,
                            labelColor: AppColor.kBlueLight,
                            unselectedLabelColor: Colors.black,
                            onTap: (value) {
                              controller.update();
                            },
                            tabs: const [
                              // first tab [you can add an icon using the icon property]
                              Tab(
                                text: "About",
                              ),

                              // second tab [you can add an icon using the icon property]
                              // Tab(
                              //   text: "Slip T.Cuti",
                              // ),
                              Tab(
                                text: "Base Stats",
                              ),
                              Tab(
                                text: "Evolution",
                              ),
                              Tab(
                                text: "Moves",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 900,
                          width: double.infinity,
                          child: TabBarView(
                              controller: controller.tabController,
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    color: AppColor.kWhite,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: ListView(children: [
                                          buildColumn(
                                              "Species", "${Get.arguments[5]}"),
                                          gapH10,
                                          buildColumn("Height",
                                              "${Get.arguments[6]} cm"),
                                          gapH10,
                                          buildColumn("Weight",
                                              "${Get.arguments[7]} kg"),
                                          gapH10,
                                          buildColumn("Abilities",
                                              "${Get.arguments[8]}"),
                                          gapH12,
                                          const Text(
                                            "Breeding",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          gapH12,
                                          buildColumn("Gender", "Monster"),
                                          gapH10,
                                          buildColumn("Egg Groups", "Monster"),
                                          gapH10,
                                          buildColumn("Egg Cycle",
                                              "${Get.arguments[3]}"),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    color: AppColor.kWhite,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text("HP"),
                                                  gapW16,
                                                  const Text("45"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 80,
                                                    color: AppColor.kRedDark,
                                                  )
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("Attack"),
                                                  gapW16,
                                                  const Text("60"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 140,
                                                    color: AppColor.kGreen,
                                                  )
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("Defence"),
                                                  gapW16,
                                                  const Text("48"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 80,
                                                    color: AppColor.kRedDark,
                                                  ),
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("SP. Atk"),
                                                  gapW16,
                                                  const Text("65"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 150,
                                                    color: AppColor.kGreen,
                                                  )
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("SP. Def"),
                                                  gapW16,
                                                  const Text("65"),
                                                  gapW16,
                                                  Container(
                                                      height: 2,
                                                      width: 150,
                                                      color: AppColor.kGreen)
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("Speed"),
                                                  gapW16,
                                                  const Text("45"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 80,
                                                    color: AppColor.kRedDark,
                                                  )
                                                ],
                                              ),
                                              gapH16,
                                              Row(
                                                children: [
                                                  const Text("Total"),
                                                  gapW16,
                                                  const Text("317"),
                                                  gapW16,
                                                  Container(
                                                    height: 2,
                                                    width: 200,
                                                    color: AppColor.kGreen,
                                                  )
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ))),
          Positioned(
              top: 145,
              right: 0,
              left: 0,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.network(Get.arguments[1])))),
        ],
      ),
    ));
  }

  Widget buildColumn(String firstRow, String secondRow) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            firstRow,
          ),
          Text(secondRow)
        ],
      );
}
