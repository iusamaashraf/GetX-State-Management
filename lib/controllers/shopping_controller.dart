import 'package:get/get.dart';
import 'package:getx_state_management/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  //updating  process is here every information every event be getting inside!!!!!!!!!!!!!!!!

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    var productResult = [
      Product(id: 1, price: 280),
      Product(id: 2, price: 80),
      Product(id: 3, price: 20),
      Product(id: 4, price: 28),
    ];

    products.value = productResult;
  }
}
