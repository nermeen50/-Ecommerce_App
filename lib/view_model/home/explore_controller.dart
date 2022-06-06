import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/services/category_service.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  final List<CategoryModel> _categoryModel = [];
  final List<ProductModel> _productModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> get productModel => _productModel;
  RxBool isLoading = false.obs;
  HomeService categories = HomeService();
  getAllCategories() {
    isLoading.value = true;
    try {
      Future.delayed(const Duration(seconds: 1), () async {
        await categories.getCategories().then((value) {
          for (int index = 0; index < value.length; index++) {
            _categoryModel.add(CategoryModel.fromJson(
                value[index].data() as Map<String, dynamic>));
          }
        }).whenComplete(() => isLoading.value = false);
      });
    } catch (error) {
      isLoading.value = false;
      return throw Exception(error);
    }
  }

  getAllProductBestSelling() {
    isLoading.value = true;
    try {
      Future.delayed(const Duration(seconds: 1), () async {
        await categories.getProductsBestSelling().then((value) {
          for (int index = 0; index < value.length; index++) {
            productModel.add(ProductModel.fromJson(
                value[index].data() as Map<String, dynamic>));
          }
        }).whenComplete(() => isLoading.value = false);
      });
    } catch (error) {
      isLoading.value = false;
      return throw Exception(error);
    }
  }

  ExploreController() {
    getAllCategories();
    getAllProductBestSelling();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _categoryModel.clear();
    _productModel.clear();
  }
}
