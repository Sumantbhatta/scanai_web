import 'package:flutter/material.dart';
import 'navbar.dart';

class header extends StatelessWidget {
  const header({super.key, required this.onNavTap});

  final ValueChanged<String> onNavTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCompact = constraints.maxWidth < 980;

          if (isCompact) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 72,
                      width: 72,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.person_outline,
                            size: 22, color: Color(0xFF5A3182)),
                        SizedBox(width: 14),
                        Icon(Icons.menu_rounded,
                            size: 24, color: Color(0xFF5A3182)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                navbar(onItemTap: onNavTap),
              ],
            );
          }

          return Row(
            children: [
              Image.asset(
                'assets/logo.png',
                height: 78,
                width: 78,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Center(child: navbar(onItemTap: onNavTap)),
              ),
              const Row(
                children: [
                  Icon(Icons.person_outline,
                      size: 22, color: Color(0xFF5A3182)),
                  SizedBox(width: 16),
                  Icon(Icons.menu_rounded, size: 24, color: Color(0xFF5A3182)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
