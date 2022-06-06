import 'package:ecommerce_app/view/home/cart_view.dart';
import 'package:ecommerce_app/view/home/explore_view.dart';
import 'package:ecommerce_app/view/home/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  RxList<Widget> currentPage =
      <Widget>[ExploreView(), const CartView(), const ProfileView()].obs;
  int get currentIndex => _currentIndex.value;
  void changeTab(int index) {
    _currentIndex.value = index;
  }
}
