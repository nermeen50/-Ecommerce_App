import 'package:ecommerce_app/view_model/auth/auth_controller.dart';
import 'package:ecommerce_app/view_model/home/explore_controller.dart';
import 'package:ecommerce_app/view_model/home/home_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExploreController());
  }
}
