import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';

class aboutsection extends StatelessWidget {
  const aboutsection({super.key});

  static const Color primary = Color(0xFF5A3182);
  static const Color accent = Color(0xFFE063A3);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔥 Top Content
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "WELCOME TO SCANAI",
                style: TextStyle(
                  color: accent,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 14),

              const Text(
                "Revolutionizing Healthcare with AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: primary,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "ScanAI is an intelligent healthcare platform designed to assist in early disease detection and medical analysis using advanced AI technologies. "
                "We aim to bridge the gap between accessibility and accuracy in healthcare, empowering users with reliable insights anytime, anywhere.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 Features Row
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 20,
                children: const [
                  _FeatureItem(icon: Icons.health_and_safety, text: "Accurate Diagnosis"),
                  _FeatureItem(icon: Icons.speed, text: "Fast Results"),
                  _FeatureItem(icon: Icons.security, text: "Secure Data"),
                  _FeatureItem(icon: Icons.devices, text: "Easy to Use"),
                ],
              ),

              const SizedBox(height: 30),

              // 🔥 Button
              ElevatedButton(
                onPressed: () {
                  handleNavbarNavigation(context, 'About us');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accent,
                  elevation: 4,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Learn More",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 🔥 Bottom Image Section (FIXED + SMALLER)
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                
                width: 800,
                height: 200, // ✅ reduced size
                child: Image.asset(
                  "assets/bg4.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: 800,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// 🔥 Feature Widget
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFFF3E8FF),
          child: Icon(icon, color: Color(0xFF5A3182), size: 28),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF5A3182),
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}