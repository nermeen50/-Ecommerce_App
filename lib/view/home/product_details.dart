import 'dart:developer';

import 'package:ecommerce_app/core/constant/app_color.dart';
import 'package:ecommerce_app/custom_widget/custom_button.dart';
import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/view_model/home/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetails({Key? key, required this.productModel})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("ssssssssssssss ${widget.productModel.productId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: const [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.star_border, color: Colors.black))
        ],
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.productModel.image.toString()),
                          fit: BoxFit.fill)))),
          const SizedBox(height: 5),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CustomText(
                      text: widget.productModel.name.toString(),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(text: "Size", fontSize: 17),
                              CustomText(
                                  text: widget.productModel.size.toString()),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(text: "Color", fontSize: 20),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: widget.productModel.color,
                                      borderRadius: BorderRadius.circular(2)))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const CustomText(
                      text: "Details",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 10),
                  CustomText(
                      text: widget.productModel.description.toString(),
                      lineSpace: 2.5),
                ],
              ),
            ),
          ),
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
                  CustomText(
                      text: "\$ ${widget.productModel.price}",
                      color: AppColors.primaryColor),
                ]),
                const Expanded(child: SizedBox()),
                Expanded(
                    child: GetBuilder<CartController>(
                        init: CartController(),
                        builder: (cartData) {
                          return CustomButton(
                              text: "ADD",
                              press: () => cartData.addProductToCart(
                                  CartProductModel(
                                      name: widget.productModel.name,
                                      image: widget.productModel.image,
                                      quantity: 1,
                                      price: widget.productModel.price,
                                      productId:
                                          widget.productModel.productId)));
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }
}
