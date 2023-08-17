import 'package:flutter/material.dart';

import 'produto.dart';

class ProductDetailsPage extends StatefulWidget {
  final Produto produto;

  ProductDetailsPage({required this.produto});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  ValueNotifier<List<ItemCart>> cart = ValueNotifier<List<ItemCart>>([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
      ),
      body: Column(
        children: [
          Image.asset(widget.produto.imagem),
          Text(widget.produto.nome),
          Text('\$${widget.produto.preco.toStringAsFixed(2)}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              List<ItemCart> updatedCartItems =
                  List.from(cart.value); // Cria uma cópia da lista atual
              updatedCartItems.add(ItemCart(
                  produto: widget.produto,
                  quantidade:
                      quantity)); // Adicione o novo item à lista copiada

              cart.value =
                  updatedCartItems; // Atribua a lista atualizada ao ValueNotifier
            },
            child: const Text("Adicionar ao Carrinho"),
          ),
        ],
      ),
    );
  }
}

class ItemCart {
  final Produto produto;
  int quantidade;

  ItemCart({required this.produto, required this.quantidade});
}
