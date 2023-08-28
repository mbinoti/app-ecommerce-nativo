import 'package:ecommerce_app/produto.dart';
import 'package:flutter/material.dart';

import 'CartIconWidget.dart';
import 'cart_controller.dart';
import 'cart_page.dart';
import 'item_cart.dart';
import 'product_details_page.dart';

class ProductGridView extends StatelessWidget {
  // Exemplo de lista de produtos.
  final List<Produto> produtos = [
    Produto(
        nome: "Snacks Plate",
        preco: 15.0,
        quantidade: 10,
        imagem: "assets/images/snacks-plate.jpg"),
    Produto(
        nome: "Salt Pepper Olives",
        preco: 20.0,
        quantidade: 5,
        imagem: "assets/images/salt-pepper-olives.jpg"),
    Produto(
        nome: "Salt Pepper Lemon",
        preco: 18.0,
        quantidade: 8,
        imagem: "assets/images/salt-pepper-lemon.jpg"),
    Produto(
        nome: "Plate And Bowl",
        preco: 25.0,
        quantidade: 7,
        imagem: "assets/images/plate-and-bowl.jpg"),
    Produto(
        nome: "Pizza Plate",
        preco: 30.0,
        quantidade: 12,
        imagem: "assets/images/pizza-plate.jpg"),
    Produto(
        nome: "Piggy Pink",
        preco: 10.0,
        quantidade: 15,
        imagem: "assets/images/piggy-pink.jpg"),
    Produto(
        nome: "Piggy Green",
        preco: 10.0,
        quantidade: 14,
        imagem: "assets/images/piggy-green.jpg"),
    Produto(
        nome: "Piggy Blue",
        preco: 10.0,
        quantidade: 18,
        imagem: "assets/images/piggy-blue.jpg"),
    Produto(
        nome: "Pasta Plate",
        preco: 28.0,
        quantidade: 6,
        imagem: "assets/images/pasta-plate.jpg"),
    Produto(
        nome: "Mozzarella Plate",
        preco: 22.0,
        quantidade: 9,
        imagem: "assets/images/mozzarella-plate.jpg"),
    Produto(
        nome: "Juicer Citrus Fruits",
        preco: 35.0,
        quantidade: 4,
        imagem: "assets/images/juicer-citrus-fruits.jpg"),
    Produto(
        nome: "Honey Pot",
        preco: 12.0,
        quantidade: 11,
        imagem: "assets/images/honey-pot.jpg"),
    Produto(
        nome: "Flowers Plate",
        preco: 16.0,
        quantidade: 13,
        imagem: "assets/images/flowers-plate.jpg"),
    Produto(
        nome: "Bruschetta Plate",
        preco: 24.0,
        quantidade: 5,
        imagem: "assets/images/bruschetta-plate.jpg"),
  ];
  final cartItemCount = ValueNotifier<int>(0);
  final CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          CartIconWidget(cartController: cartController),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.8,
              ),
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ProductItem(produto: produtos[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Produto produto;

  ProductItem({required this.produto});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(produto: produto),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(1.0), // margem aumentada
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4, // Maior proporção para a imagem
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  // color: Colors.white,
                  produto.imagem,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Text(
                produto.nome,
                style: TextStyle(
                  fontSize: 12, // Fonte reduzida
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 11, // Fonte reduzida
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
