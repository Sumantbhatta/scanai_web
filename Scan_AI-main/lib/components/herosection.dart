import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';

class herosection extends StatelessWidget {
  const herosection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ✅ Reduced height (responsive)
      height: MediaQuery.of(context).size.height * 0.8,

      child: Stack(
        children: [
          // 🔥 Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/bg1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 🔥 Opacity Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),

          // 🔥 Content
          Positioned(
            left: 40,
            top: 70, // adjusted for smaller height
            child: SizedBox(
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subtitle
                  Text(
                    "Caring For Life",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Title
                  Text(
                    "Leading the Way\nin Medical Excellence.",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Button
                  ElevatedButton(
                    onPressed: () {
                      handleNavbarNavigation(context, 'Products');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE063A3),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Our Services",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
