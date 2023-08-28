import 'package:flutter/material.dart';

import 'cart_controller.dart';

import 'produto.dart';

class ProductDetailsPage extends StatefulWidget {
  final Produto produto;

  ProductDetailsPage({required this.produto});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ValueNotifier<int> quantity = ValueNotifier<int>(1);

  // int quantity = 1;
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            width: 180,
            child: Image.asset(widget.produto.imagem),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.produto.nome, style: const TextStyle(fontSize: 8)),
                const SizedBox(height: 10),
                const Divider(color: Colors.black26, height: 0, thickness: 0),
                const SizedBox(height: 10),
                Text(
                  '\$${widget.produto.preco.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 8),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black26, height: 1, thickness: 0),
                const SizedBox(height: 10),
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
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black26, height: 1, thickness: 0),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      cartController.addToCart(widget.produto, quantity.value);
                    },
                    child: const Text("Adicionar ao Carrinho",
                        style: TextStyle(fontSize: 8)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
