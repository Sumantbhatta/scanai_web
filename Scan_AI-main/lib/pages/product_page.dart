import 'package:flutter/material.dart';
import 'package:scan_ai/components/footer.dart';
import 'package:scan_ai/components/header.dart';
import 'package:scan_ai/components/products.dart';
import 'package:scan_ai/utils/navigation.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(onNavTap: (item) => handleNavbarNavigation(context, item)),
            ProductsSection(),
            const footer(),
          ],
        ),
      ),
    );
  }
}
