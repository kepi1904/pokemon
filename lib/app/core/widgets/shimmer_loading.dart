import 'package:flutter/material.dart';
import 'package:pokemon/app/core/values/app_color.dart';
import 'package:pokemon/app/core/values/app_sizes.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding:
          const EdgeInsets.only(top: 100, left: 20.0, right: 20, bottom: 20),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Shimmer.fromColors(
              baseColor: AppColor.kGrey.withOpacity(0.5),
              highlightColor: AppColor.kWhite,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH40,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                  gapH10,
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Container(
                      color: AppColor.kGrey,
                    ),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
