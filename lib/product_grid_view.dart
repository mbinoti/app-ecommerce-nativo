import 'package:ecommerce_app/produto.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: cartItemCount,
            builder: (context, value, child) {
              return Container(
                width: 60,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        onPressed: () {
                          cartItemCount.value++;
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const CartPage(),
                          //   ),
                          // );
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
                          '$value',
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
          ),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CartPage(),
                //   ),
                // );
              },
              icon: const Icon(Icons.login)),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return ProductItem(produto: produtos[index]);
            },
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Produto produto;

  ProductItem({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Stack(
              children: [
                myCard(context, produto),
                Positioned(
                  child: Text(
                    produto.nome,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    color: const Color.fromARGB(255, 102, 102, 100)
                        .withOpacity(0.5), // Just for visibility
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'R\$ ${produto.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 10,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${produto.quantidade} unidades',
                          style: const TextStyle(
                            fontSize: 10,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget myCard(BuildContext context, Produto produto) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          produto.imagem,
          fit: BoxFit.cover,
        ),
      )
    ],
  );
}
