import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  const navbar({super.key, required this.onItemTap});

  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navItem("Home"),
          const SizedBox(width: 28),
          _navItem("About us"),
          const SizedBox(width: 28),
          _navItem("Products"),
          const SizedBox(width: 28),
          _navItem("Download"),
          const SizedBox(width: 28),
          _navItem("Contact Us"),
        ],
      ),
    );
  }

  Widget _navItem(String text) {
    return InkWell(
      onTap: () {
        onItemTap(text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF5A3182),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
