import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/view_model/home/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Expanded(
              child: Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.cartProductList.isEmpty
                      ? const Center(
                          child: CustomText(
                              text: "No Product In Cart",
                              alignment: AlignmentDirectional.center))
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: controller.cartProductList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Row(
                                children: [
                                  Container(
                                      height: 170,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                          controller
                                              .cartProductList[index].image!,
                                          fit: BoxFit.cover)),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: controller
                                              .cartProductList[index].name!,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      const SizedBox(height: 15),
                                      CustomText(
                                          text:
                                              '\$ ${controller.cartProductList[index].price!}',
                                          color: AppColors.primaryColor),
                                      const SizedBox(height: 15),
                                      Container(
                                        color: AppColors.grayLightColor,
                                        child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () => controller
                                                    .increaseQuanity(index),
                                                icon: const Icon(Icons.add)),
                                            GetBuilder<CartController>(
                                                builder: (context) {
                                              return CustomText(
                                                  text: controller
                                                      .cartProductList[index]
                                                      .quantity
                                                      .toString());
                                            }),
                                            IconButton(
                                                onPressed: () => controller
                                                    .decreaseQuanity(index),
                                                icon: const Icon(Icons.remove)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 15)))),
          Container(
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: AppColors.grayLightColor,
                  spreadRadius: 5,
                  blurRadius: 5)
            ]),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const CustomText(
                      text: "PRICE", color: AppColors.grayDarkColor),
                  const SizedBox(height: 5),
                  GetBuilder<CartController>(
                      init: Get.find<CartController>(),
                      builder: (cartPrice) {
                        return CustomText(
                            text: "\$ ${cartPrice.totalPrice}",
                            color: AppColors.primaryColor);
                      }),
                ]),
                const Expanded(child: SizedBox()),
                const Expanded(child: CustomButton(text: "CHECK OUT"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
