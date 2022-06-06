import 'package:ecommerce_app/custom_widget/custom_text.dart';
import 'package:ecommerce_app/view_model/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => controller.currentPage[controller.currentIndex]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                onTap: (index) => controller.changeTab(index),
                currentIndex: controller.currentIndex,
                elevation: 0.0,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Column(children: [
                      const CustomText(
                          text: 'Explore',
                          alignment: AlignmentDirectional.center),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      )
                    ]),
                    label: '',
                    icon: Image.asset('assets/images/Icon_Explore.png'),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Column(children: [
                      const CustomText(
                          text: 'Cart', alignment: AlignmentDirectional.center),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      )
                    ]),
                    label: '',
                    icon: Image.asset('assets/images/Icon_Cart.png'),
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Column(children: [
                      const CustomText(
                          text: 'Profile',
                          alignment: AlignmentDirectional.center),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      )
                    ]),
                    label: '',
                    icon: Image.asset('assets/images/Icon_User.png'),
                  )
                ])));
  }
}
