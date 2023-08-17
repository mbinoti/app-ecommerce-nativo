import 'package:flutter/material.dart';

import 'product_details_page.dart';
import 'produto.dart';

class CartController {
  ValueNotifier<List<ItemCart>> cartItems = ValueNotifier<List<ItemCart>>([]);
  void addToCart(Produto produto, int quantidade) {
    final existingItem = cartItems.value.firstWhere(
      (item) => item.produto.nome == produto.nome,
      orElse: () => ItemCart(
          produto: produto,
          quantidade: 0), // Aqui nós criamos um novo ItemCart com quantidade 0.
    );

    if (existingItem.quantidade == 0) {
      // Se é o novo ItemCart que nós criamos anteriormente
      existingItem.quantidade = quantidade;
      cartItems.value.add(existingItem);
    } else {
      existingItem.quantidade += quantidade;
    }

    cartItems.notifyListeners();
  }

  void removeFromCart(Produto produto) {
    // Implemente a lógica para remover um item do carrinho
  }

  void updateQuantity(Produto produto, int quantidade) {
    // Implemente a lógica para atualizar a quantidade de um item no carrinho
  }
}
