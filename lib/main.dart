import 'package:flutter/material.dart';

import 'product_details_page.dart';
import 'product_grid_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.white,
          secondary: Colors
              .white, // ou qualquer outra cor de sua escolha para o secundário
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ProductGridView(),
    );
  }
}
