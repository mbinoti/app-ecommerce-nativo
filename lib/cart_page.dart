// cart_page.dart
import 'package:flutter/material.dart';
import 'cart_controller.dart';
import 'item_cart.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
      ),
      body: ValueListenableBuilder<List<ItemCart>>(
        valueListenable: cartController.cartItems,
        builder: (context, items, _) {
          if (items.isEmpty) {
            return const Center(child: Text('Seu carrinho está vazio.'));
          }

          double total = items.fold(
              0, (sum, item) => sum + (item.produto.preco * item.quantidade));

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemWidget(
                      item: item,
                      cartController: cartController,
                      quantity: ValueNotifier<int>(item.quantidade),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                        color: Colors.black26, height: 1, thickness: 1);
                  },
                ),
              ),
              const Divider(color: Colors.black26, thickness: 1),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total: \$${total.toStringAsFixed(2)}'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        // Adicione a lógica do checkout aqui
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final ItemCart item;
  final CartController cartController;
  final ValueNotifier<int> quantity;

  CartItemWidget({
    required this.item,
    required this.cartController,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Image.asset(item.produto.imagem),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.produto.nome, style: const TextStyle(fontSize: 8)),
              const SizedBox(height: 10),
              Text(
                '\$${item.produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('quantidade:', style: TextStyle(fontSize: 8)),
                  const SizedBox(width: 30),
                  IntrinsicWidth(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              quantity.value--;
                              cartController.updateQuantity(
                                  item.produto, quantity.value);
                            },
                          ),
                          ValueListenableBuilder<int>(
                            valueListenable: quantity,
                            builder: (context, value, _) {
                              return Text('$value');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              quantity.value++;
                              cartController.updateQuantity(
                                  item.produto, quantity.value);
                            },
                          ),
                          // Ícone para remover o item do carrinho
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.red, size: 30),
                    onPressed: () {
                      cartController.removeFromCart(item.produto);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
