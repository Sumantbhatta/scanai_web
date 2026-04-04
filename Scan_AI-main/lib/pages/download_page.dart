import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';
import '../components/header.dart';
import '../components/footer.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3F7),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ HEADER
            header(
              onNavTap: (item) => handleNavbarNavigation(context, item),
            ),

            // ✅ MAIN CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      const Text(
                        "Get Medical Advice\nWithout Leaving Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "Connect with licensed doctors anytime, anywhere. "
                        "Secure, fast, and reliable telehealth at your fingertips.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 30),

                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Download link will be available soon. Contact us for early access.',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.download),
                        label: const Text("Download App"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Phone UI
                      Container(
                        width: 220,
                        height: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1582750433449-648ed127bb54",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoCard(
                            icon: Icons.public,
                            title: "350M+",
                            subtitle: "Users worldwide",
                          ),
                          _infoCard(
                            icon: Icons.lock,
                            title: "Secure",
                            subtitle: "Private chats",
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // ✅ FOOTER
                      const footer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
