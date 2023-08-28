import 'package:flutter/material.dart';
import 'cart_controller.dart';
import 'cart_page.dart';
import 'item_cart.dart';

class CartIconWidget extends StatelessWidget {
  final CartController cartController;

  CartIconWidget({required this.cartController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ItemCart>>(
      valueListenable: cartController.cartItems,
      builder: (context, cartItems, child) {
        int itemCount = cartItems.fold(0, (sum, item) => sum + item.quantidade);

        return SizedBox(
          width: 60,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),
              Positioned(
                right: 10,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
