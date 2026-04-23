import 'package:flutter/material.dart';

class services extends StatelessWidget {
  const services({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            Column(
              children: [
                Text(
                  "CARE YOU CAN BELIEVE IN",
                  style: TextStyle(
                    color: const Color(0xFFE063A3),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Our Services",
                  style: TextStyle(
                    color: Color(0xFF5A3182),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Main Grid
            LayoutBuilder(builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 800;
              return isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildContent(context, isMobile),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildContent(context, isMobile),
                    );
            }),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    // Left Side Menu
    Widget leftMenu = Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _menuItem("AI Health Scan"),
          _menuItem("Smart Diagnosis",
              bgColor: const Color(0xFF5A3182), textColor: Colors.white),
          _menuItem("Medical Reports"),
          _menuItem("Disease Detection"),
        ],
      ),
    );

    // Middle Content
    Widget middleContent = Expanded(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: isMobile ? 0 : 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI-powered healthcare designed for accuracy and care.",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF5A3182),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                "Early Disease Detection",
                "AI-Powered Analysis",
                "Fast & Accurate Results",
                "Secure Medical Data",
                "User-Friendly Interface",
                "24/7 Accessibility"
              ]
                  .map((item) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE063A3),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(item,
                              style: const TextStyle(
                                  color: Color(0xFF5A3182),
                                  fontWeight: FontWeight.w500)),
                        ],
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              "ScanAI leverages advanced artificial intelligence to assist in early detection of diseases, helping users and healthcare professionals make faster and more informed decisions.",
              style:
                  TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 8),
            Text(
              "Our platform ensures accuracy, security, and ease of use—making healthcare more accessible and reliable for everyone.",
              style:
                  TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.6),
            ),
          ],
        ),
      ),
    );

    // Right Images (unchanged)
    Widget rightImages = Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("assets/service1.jpg",
              width: 200, height: 150, fit: BoxFit.cover),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("assets/service2.jpg",
              width: 200, height: 150, fit: BoxFit.cover),
        ),
      ],
    );

    return [
      leftMenu,
      SizedBox(width: isMobile ? 0 : 20, height: isMobile ? 20 : 0),
      middleContent,
      SizedBox(width: isMobile ? 0 : 20, height: isMobile ? 20 : 0),
      rightImages,
    ];
  }

  Widget _menuItem(String title, {Color? bgColor, Color? textColor}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? const Color(0xFF5A3182),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}