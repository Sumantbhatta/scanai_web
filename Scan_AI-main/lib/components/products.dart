import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';

class productssection extends StatelessWidget {
  const productssection({super.key});

  static const Color _primary = Color(0xFF5A3182);
  static const Color _secondary = Color(0xFF5A3283);
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
          _heroSection(context),
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
          _ctaPanel(context),
        ],
      ),
    );
  }

  // ---------------- HERO ----------------
  Widget _heroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [_primary, _softAccent],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Text(
        'Smart Medical Devices Powered by AI',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }

  // ---------------- TITLE ----------------
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
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: _primary,
          ),
        ),
        const SizedBox(height: 6),
        Text(description),
      ],
    );
  }

  // ---------------- GRID ----------------
  Widget _productGrid(BuildContext context, List<_ProductModel> products) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: products
          .map(
            (p) => SizedBox(
              width: 320,
              child: _HoverProductCard(
                product: p,
                onBuildContent: (ctx) => _productCard(ctx, p),
              ),
            ),
          )
          .toList(),
    );
  }

  // ---------------- PRODUCT CARD ----------------
  Widget _productCard(BuildContext context, _ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔥 IMAGE HEIGHT INCREASED HERE
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            height: 220, // ✅ increased height
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: _accent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(product.icon, color: Colors.white),
        ),
        const SizedBox(height: 10),

        Text(
          product.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: _primary,
          ),
        ),

        Text(
          product.tagline,
          style: const TextStyle(color: _accent, fontSize: 13),
        ),

        const SizedBox(height: 8),

        Text(product.description),

        const SizedBox(height: 10),

        ...product.features.map((f) => Text("• $f")),
        const SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {},
          child: Text(product.cta),
        )
      ],
    );
  }

  // ---------------- CTA ----------------
  Widget _ctaPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: _primary.withOpacity(0.1),
      child: const Text(
        "Upgrade your healthcare setup with ScanAI",
        textAlign: TextAlign.center,
      ),
    );
  }

  // ---------------- DATA ----------------
  static final List<_ProductModel> _ecgProducts = [
    _ProductModel(
      icon: Icons.monitor_heart,
      name: 'ECG Lite',
      tagline: 'Simple & Portable',
      description: 'Basic ECG monitoring device.',
      features: ['Portable', 'Real-time'],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/p1.jpeg',
    ),
    _ProductModel(
      icon: Icons.favorite,
      name: 'ECG Plus',
      tagline: 'Smart Monitoring',
      description: 'Advanced ECG tracking system.',
      features: ['Continuous monitoring', 'AI alerts'],
      useCases: [],
      cta: 'Buy Now',
      image: 'assets/p2.jpeg',
    ),
    _ProductModel(
      icon: Icons.health_and_safety,
      name: 'ECG Pro',
      tagline: 'Clinical Grade',
      description: 'Professional ECG system.',
      features: ['12-channel', 'AI diagnostics'],
      useCases: [],
      cta: 'Contact Sales',
      image: 'assets/p3.jpeg',
    ),
  ];

  static final List<_ProductModel> _xrayProducts = [
    _ProductModel(
      icon: Icons.mobile_friendly,
      name: 'X-Ray Mobile',
      tagline: 'Portable Imaging',
      description: 'Mobile X-ray system.',
      features: ['Portable', 'Fast setup'],
      useCases: [],
      cta: 'Request Demo',
      image: 'assets/service1.jpg',
    ),
    _ProductModel(
      icon: Icons.image_search,
      name: 'X-Ray Pro',
      tagline: 'High Quality Imaging',
      description: 'Digital X-ray system.',
      features: ['HD imaging', 'DICOM'],
      useCases: [],
      cta: 'Contact Sales',
      image: 'assets/service2.jpg',
    ),
  ];
}

// ---------------- MODEL ----------------
class _ProductModel {
  final IconData icon;
  final String name;
  final String tagline;
  final String description;
  final List<String> features;
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

// ---------------- HOVER CARD ----------------
class _HoverProductCard extends StatefulWidget {
  final _ProductModel product;
  final Widget Function(BuildContext) onBuildContent;

  const _HoverProductCard({
    required this.product,
    required this.onBuildContent,
  });

  @override
  State<_HoverProductCard> createState() => _HoverProductCardState();
}

class _HoverProductCardState extends State<_HoverProductCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Card(
          elevation: hover ? 12 : 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.onBuildContent(context),
          ),
        ),
      ),
    );
  }
}