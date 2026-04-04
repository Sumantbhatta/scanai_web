import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';

class aboutsection extends StatelessWidget {
  const aboutsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Content
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO SCANAI",
                style: TextStyle(
                  color: const Color(0xFFE063A3),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "A Great Place to Receive Care",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A3182),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                "Quisque placerat scelerisque tortor ornare ornare. "
                "Convallis felis vitae tortor augue. Velit nascetur proin massa in.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  handleNavbarNavigation(context, 'About us');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE063A3),
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Learn More",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Bottom Image (full width)
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/bg4.jpg", // make sure this exists in assets
            width: 400, // full width
            height: 300, // fix height
            //fit: BoxFit.cover,      // fill container and crop excess
          ),
        ),
      ],
    );
  }
}
