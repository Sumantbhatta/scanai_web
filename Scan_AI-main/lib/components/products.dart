import 'package:flutter/material.dart';
import 'package:scan_ai/pages/product_detail_page.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  static const Color _primary = Color(0xFF5A3182);
  static const Color _accent = Color(0xFFE063A3);
  static const Color _softAccent = Color(0xFFC659A5);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _heroSection(),
          const SizedBox(height: 40),
          _sectionTitle(
            title: 'ECG Devices for Everyday Health Monitoring',
            description:
                'Monitor your heart health anytime, anywhere with ScanAI portable ECG devices.',
            icon: Icons.favorite,
          ),
          const SizedBox(height: 20),
          _productGrid(context, _ecgProducts),
          const SizedBox(height: 46),
          _sectionTitle(
            title: 'Portable X-Ray Systems for Clinics and Professionals',
            description:
                'Empower your clinic with high-quality imaging solutions.',
            icon: Icons.medical_services,
          ),
          const SizedBox(height: 20),
          _productGrid(context, _xrayProducts),
          const SizedBox(height: 46),
          _ctaPanel(),
        ],
      ),
    );
  }

  // HERO
  Widget _heroSection() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [_primary, _softAccent]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        'Smart Medical Devices Powered by AI',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }

  // TITLE
  Widget _sectionTitle({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: _accent),
            const SizedBox(width: 8),
            const Text(
              'PRODUCT CATALOG',
              style: TextStyle(color: _accent),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: _primary),
        ),
        const SizedBox(height: 4),
        Text(description),
      ],
    );
  }

  // GRID
  Widget _productGrid(BuildContext context, List<_ProductModel> products) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (screenWidth > 1200) {
      crossAxisCount = 3; // desktop
    } else if (screenWidth > 800) {
      crossAxisCount = 2; // tablet
    } else {
      crossAxisCount = 1; // mobile
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 0.9, // 🔥 controls card height
      ),
      itemBuilder: (context, index) {
        final p = products[index];

        return _HoverProductCard(
          child: _productCard(context, p),
        );
      },
    );
  }

  // PRODUCT CARD
  Widget _productCard(BuildContext context, _ProductModel product) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center, // ✅ CENTER EVERYTHING
    children: [

      // 🔥 TOP HALF → IMAGE
      Expanded(
        flex: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),

      // 🔥 BOTTOM HALF → CONTENT
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center, // ✅ CENTER
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.center, // ✅ CENTER
                children: [
                  // ICON
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: _accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(product.icon, color: Colors.white, size: 20),
                  ),

                  const SizedBox(height: 8),

                  // NAME
                  Text(
                    product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _primary,
                    ),
                  ),

                  // TAGLINE
                  Text(
                    product.tagline,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: _accent,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // DESCRIPTION
                  Text(
                    product.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),

                  const SizedBox(height: 8),

                  // ✅ FEATURES CENTERED
                  ...product.features.take(2).map(
                    (f) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "• ${f['title']}",
                        textAlign: TextAlign.center, // ✅ CENTER BULLETS
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),

              // BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: Text(product.cta),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

  // CTA
  Widget _ctaPanel() {
    return Container(
      padding: const EdgeInsets.all(24),
      color: _primary.withOpacity(0.1),
      child: const Text(
        "Upgrade your healthcare setup with ScanAI",
        textAlign: TextAlign.center,
      ),
    );
  }

  // ================= DATA =================

  static final List<_ProductModel> _ecgProducts = [
    _ProductModel(
      icon: Icons.favorite,
      name: 'ECG Plus',
      tagline: 'Smart Home Monitoring',
      description: 'Advanced ECG tracking system.',
      features: [
        {"title": "Clinical Accuracy", "desc": "99.7% accuracy."},
        {"title": "Sharp Sensitivity", "desc": "Detects irregularities."},
        {"title": "No Battery Needed", "desc": "Works offline."},
        {"title": "Easy to Use", "desc": "Simple UI."},
      ],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/p2.jpeg',
    ),
    _ProductModel
    (
      icon: Icons.monitor_heart,
      name: 'ECG Lite',
      tagline: 'Portable Clinical Monitoring',
      description: 'Compact ECG monitoring device.',
      features: [
        {"title": "Portable", "desc": "Lightweight"},
        {"title": "Real-time Monitoring", "desc": "Instant ECG"},
      ],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/p1.jpeg',
    ),
    _ProductModel(
      icon: Icons.health_and_safety,
      name: 'ECG Pro',
      tagline: 'Hospital Grade',
      description: 'Advanced 12-lead ECG system.',
      features: [
        {"title": "12 Lead ECG", "desc": "Full analysis"},
        {"title": "Smart Integration", "desc": "Mobile apps"},
      ],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/p3.jpeg',
    ),
  ];

  static final List<_ProductModel> _xrayProducts = [
    _ProductModel(
      icon: Icons.mobile_friendly,
      name: 'Mobile Portable X-Ray',
      tagline: 'Portable Imaging',
      description: 'Mobile X-ray system.',
      features: [
        {"title": "Portable", "desc": "Easy movement"},
        {"title": "Fast Imaging", "desc": "Quick diagnosis"},
      ],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/mobile_portable_xray.jpeg',
    ),
    _ProductModel(
      icon: Icons.image_search,
      name: 'X-Ray Pro',
      tagline: 'High Quality Imaging',
      description: 'Advanced digital X-ray system.',
      features: [
        {"title": "HD Imaging", "desc": "Clear images"},
        {"title": "DICOM", "desc": "Hospital integration"},
      ],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/xray_handheld.jpeg',
    ),
  ];
}

// MODEL
class _ProductModel {
  final IconData icon;
  final String name;
  final String tagline;
  final String description;
  final List<Map<String, String>> features;
  final List<String> useCases;
  final String cta;
  final String image;

  const _ProductModel({
    required this.icon,
    required this.name,
    required this.tagline,
    required this.description,
    required this.features,
    required this.useCases,
    required this.cta,
    required this.image,
  });
}

// HOVER CARD
class _HoverProductCard extends StatefulWidget {
  final Widget child;

  const _HoverProductCard({required this.child, super.key});

  @override
  State<_HoverProductCard> createState() => _HoverProductCardState();
}

class _HoverProductCardState extends State<_HoverProductCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        child: Card(
          elevation: isHover ? 12 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
