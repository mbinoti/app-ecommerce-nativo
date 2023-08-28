import 'package:flutter/material.dart';

import 'item_cart.dart';
import 'produto.dart';

class CartController {
  ValueNotifier<List<ItemCart>> cartItems = ValueNotifier<List<ItemCart>>([]);

  // Singleton setup
  static final CartController _singleton = CartController._internal();
  factory CartController() {
    return _singleton;
  }
  CartController._internal();

  void addToCart(Produto produto, int quantity) {
    List<ItemCart> updatedCartItems = List.from(cartItems.value);
    var itemIndex = updatedCartItems
        .indexWhere((item) => item.produto.nome == produto.nome);

    if (itemIndex >= 0) {
      updatedCartItems[itemIndex].quantidade += quantity;
    } else {
      updatedCartItems.add(ItemCart(produto: produto, quantidade: quantity));
    }

    cartItems.value = updatedCartItems;
  }

  void removeFromCart(Produto produto) {
    cartItems.value.removeWhere((item) => item.produto.nome == produto.nome);
    cartItems.notifyListeners();
  }

  void updateQuantity(Produto produto, int quantity) {
    List<ItemCart> updatedCartItems = List.from(cartItems.value);
    var itemIndex = updatedCartItems
        .indexWhere((item) => item.produto.nome == produto.nome);

    if (itemIndex >= 0) {
      updatedCartItems[itemIndex].quantidade = quantity;
    } // Não precisamos fazer nada se o produto não estiver no carrinho.

    cartItems.value = updatedCartItems;
  }
}
