import 'package:flutter/material.dart';

void handleNavbarNavigation(BuildContext context, String item) {
  final String normalized = item.toLowerCase().trim();

  final Map<String, String> routeMap = {
    'home': '/',
    'about us': '/about',
    'products': '/products',
    'download': '/download',
    'contact us': '/contact',
  };

  final String? targetRoute = routeMap[normalized];
  if (targetRoute == null) {
    return;
  }

  final String? currentRoute = ModalRoute.of(context)?.settings.name;
  if (currentRoute == targetRoute) {
    return;
  }

  Navigator.pushReplacementNamed(context, targetRoute);
}
