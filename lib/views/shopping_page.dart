import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controllers/cart_controller.dart';
import 'package:getx_state_management/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart, color: Colors.black),
        label: GetX<CartController>(builder: (controller) {
          return Text(controller.count.toString(),
              style: const TextStyle(color: Colors.black));
        }),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      controller
                                          .products[index].productDescription,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$${controller.products[index].price.toString()}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: const Text('Add to cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Amount: \$ ${controller.totalPrice}',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
