import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 34),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF5A3182).withOpacity(0.95),
            const Color(0xFFE063A3).withOpacity(0.95),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Section
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 768;

              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // Logo + Description
                  SizedBox(
                    width: isMobile ? double.infinity : 300,
                    child: Column(
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Explore the world's hidden treasures, waiting to be discovered with us.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Links Section
                  Wrap(
                    spacing: 50,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      footerColumn(
                        context,
                        "Quick Links",
                        [
                          "Home",
                          "Products",
                          "Download",
                          "Contact Us",
                          "About Us"
                        ],
                      ),
                      footerColumn(
                        context,
                        "Support",
                        [
                          "Help Center",
                          "Anti-discrimination",
                          "Disability Support",
                          "Cancellation Options",
                          "Report Concern"
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 20),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.2),
          ),

          const SizedBox(height: 20),

          // Bottom Section
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 768;

              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "© 2025 ScanAI. All Rights Reserved",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 20,
                    children: [
                      footerLink(context, "Privacy Policy"),
                      footerLink(context, "Terms of Service"),
                      footerLink(context, "Manage Cookies"),
                    ],
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 28),

          // Background Text at END
          Text(
            "SCANAI",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.1),
              fontSize: MediaQuery.of(context).size.width < 600 ? 54 : 116,
              fontWeight: FontWeight.w900,
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }

  // Footer Column (Quick Links / Support)
  Widget footerColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: InkWell(
              onTap: () {
                final String lower = link.toLowerCase();
                if (lower == 'home' ||
                    lower == 'about us' ||
                    lower == 'products' ||
                    lower == 'download' ||
                    lower == 'contact us') {
                  handleNavbarNavigation(context, link);
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$link support will be available soon.'),
                  ),
                );
              },
              child: Text(
                link,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.86),
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white.withOpacity(0.4),
                  decorationThickness: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Footer links in bottom section
  Widget footerLink(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$text page is coming soon.')),
        );
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 12,
          decoration: TextDecoration.underline,
          decorationColor: Colors.white.withOpacity(0.45),
        ),
      ),
    );
  }
}
