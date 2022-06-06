import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/custom_widget/custom_textfield.dart';
import 'package:ecommerce_app/view_model/home/explore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreView extends GetWidget<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const CustomTextField(
                    hint: "Search product",
                    prefixIcon: Icon(Icons.search),
                    hasBorder: true),
                const SizedBox(height: 30),
                const CustomText(
                    text: "Categories",
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      reverse: true,
                      itemCount: controller.categoryModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: Image.network(controller
                                    .categoryModel[index].image
                                    .toString())),
                            CustomText(
                                text: controller.categoryModel[index].name
                                    .toString()),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 20)),
                ),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomText(
                          text: "Best Selling",
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                      CustomText(
                          text: "See All",
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ]),
                const SizedBox(height: 30),
                Expanded(
                  flex: 4,
                  child: ListView.separated(
                      itemCount: controller.productModel.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.network(
                                    controller.productModel[index].image
                                        .toString(),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            CustomText(
                                text: controller.productModel[index].name
                                    .toString(),
                                fontWeight: FontWeight.bold),
                            CustomText(
                                text: controller.productModel[index].description
                                    .toString(),
                                color: Colors.grey,
                                fontSize: 13),
                            const SizedBox(height: 10),
                            CustomText(
                                text:
                                    "\$${controller.productModel[index].price}",
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 20)),
                ),
              ],
            ),
          ));
  }
}
