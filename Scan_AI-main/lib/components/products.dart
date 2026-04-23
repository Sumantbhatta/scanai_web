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
                'Monitor your heart health anytime, anywhere with ScanAI portable ECG devices. Designed for individuals and small clinics, our devices provide accurate readings and seamless integration with the ScanAI app.',
            icon: Icons.favorite,
          ),
          const SizedBox(height: 20),
          _productGrid(context, _ecgProducts),
          const SizedBox(height: 46),
          _sectionTitle(
            title: 'Portable X-Ray Systems for Clinics and Professionals',
            description:
                'Empower your clinic with high-quality imaging solutions designed for mobility, efficiency, and accuracy.',
            icon: Icons.medical_services,
          ),
          const SizedBox(height: 20),
          _productGrid(context, _xrayProducts),
          const SizedBox(height: 46),
          _ctaPanel(context),
          const SizedBox(height: 18),
          Center(
            child: Text(
              'ScanAI is building the future of accessible healthcare by combining AI-powered diagnostics with smart medical devices.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 34),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_primary.withOpacity(0.98), _softAccent.withOpacity(0.95)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _primary.withOpacity(0.16),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Smart Medical Devices Powered by AI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'ScanAI brings advanced diagnostic tools to your fingertips from personal heart monitoring to professional imaging systems.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _solidButton(
                context,
                label: 'Explore Devices',
                actionLabel: 'products',
              ),
              _outlineButton(
                context,
                label: 'Contact Sales',
                actionLabel: 'contact us',
              ),
            ],
          )
        ],
      ),
    );
  }

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
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: _accent.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: _accent),
            ),
            const SizedBox(width: 10),
            const Text(
              'PRODUCT CATALOG',
              style: TextStyle(
                color: _accent,
                letterSpacing: 1.2,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            color: _primary,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _productGrid(BuildContext context, List<_ProductModel> products) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth > 860;
        if (isWide) {
          final rows = <Widget>[];
          for (int i = 0; i < products.length; i += 3) {
            final rowItems =
                products.sublist(i, (i + 3).clamp(0, products.length));
            rows.add(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rowItems.map((product) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, bottom: 16),
                      child: _HoverProductCard(
                        product: product,
                        onBuildContent: (ctx) => _productCard(ctx, product),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
          return Column(children: rows);
        } else {
          return Column(
            children: products
                .map((product) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _HoverProductCard(
                        product: product,
                        onBuildContent: (ctx) => _productCard(ctx, product),
                      ),
                    ))
                .toList(),
          );
        }
      },
    );
  }

  Widget _productCard(BuildContext context, _ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _secondary.withOpacity(0.85),
                _accent.withOpacity(0.85),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(product.icon, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 14),
        Text(
          product.name,
          style: const TextStyle(
            color: _primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          product.tagline,
          style: const TextStyle(
            color: _accent,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.description,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        ...product.features
            .map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle, size: 16, color: _accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(
                          color: _primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        if (product.useCases.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            'Use Cases',
            style: TextStyle(
              color: _primary,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          ...product.useCases
              .map(
                (useCase) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '- $useCase',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13,
                    ),
                  ),
                ),
              )
              .toList(),
        ],
        const SizedBox(height: 16),
        _solidButton(
          context,
          label: product.cta,
          compact: true,
          actionLabel: _routeLabelFromCTA(product.cta),
        ),
      ],
    );
  }

  Widget _ctaPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      decoration: BoxDecoration(
        color: _primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Ready to Upgrade Your Healthcare Setup?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _primary,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Whether you are monitoring your health at home or setting up a modern clinic, ScanAI has the right solution for you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _solidButton(
                context,
                label: 'Explore App',
                actionLabel: 'download',
              ),
              _outlineButton(
                context,
                label: 'Contact Sales',
                actionLabel: 'contact us',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _solidButton(
    BuildContext context, {
    required String label,
    required String actionLabel,
    bool compact = false,
  }) {
    return ElevatedButton(
      onPressed: () {
        handleNavbarNavigation(context, actionLabel);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _accent,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 14 : 22,
          vertical: compact ? 10 : 13,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: compact ? 12 : 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _outlineButton(
    BuildContext context, {
    required String label,
    required String actionLabel,
  }) {
    return OutlinedButton(
      onPressed: () {
        handleNavbarNavigation(context, actionLabel);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1.1),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  String _routeLabelFromCTA(String ctaText) {
    final lower = ctaText.toLowerCase();
    if (lower.contains('contact') || lower.contains('request')) {
      return 'contact us';
    }
    if (lower.contains('buy now')) {
      return 'download';
    }
    return 'products';
  }

  static final List<_ProductModel> _ecgProducts = [
    _ProductModel(
      icon: Icons.monitor_heart,
      name: 'ScanAI ECG Lite',
      tagline: 'Simple. Portable. Reliable.',
      description:
          'A compact ECG device designed for everyday users who want quick and easy heart monitoring at home.',
      features: const [
        'Lightweight and portable',
        'Real-time heart monitoring',
        'Mobile app connectivity',
        'AI-based analysis support',
      ],
      useCases: const [
        'Daily health tracking',
        'Early detection of irregularities',
      ],
      cta: 'Buy Now / Coming Soon',
    ),
    _ProductModel(
      icon: Icons.favorite_border,
      name: 'ScanAI ECG Plus',
      tagline: 'Smart Monitoring for Modern Health',
      description:
          'An advanced portable ECG system with enhanced accuracy and continuous monitoring capabilities.',
      features: const [
        'Continuous ECG tracking',
        'Smart alerts and insights',
        'Seamless app integration',
        'Designed for home and semi-clinical use',
      ],
      useCases: const [],
      cta: 'Buy Now / Coming Soon',
    ),
    _ProductModel(
      icon: Icons.health_and_safety,
      name: 'ScanAI ECG Pro',
      tagline: 'Clinical-Grade Precision',
      description:
          'A professional-grade ECG device suitable for clinics and advanced diagnostics.',
      features: const [
        '12-channel ECG',
        'High precision readings',
        'AI-assisted diagnostics',
        'Clinical-grade performance',
      ],
      useCases: const [],
      cta: 'Buy Now / Contact Sales',
    ),
  ];

  static final List<_ProductModel> _xrayProducts = [
    _ProductModel(
      icon: Icons.mobile_friendly,
      name: 'ScanAI X-Ray Mobile',
      tagline: 'Mobility Meets Diagnostics',
      description:
          'A compact and portable X-ray system designed for clinics, home visits, and mobile diagnostics.',
      features: const [
        'Easy to transport',
        'Quick imaging setup',
        'Ideal for small clinics',
        'Cost-effective solution',
      ],
      useCases: const [],
      cta: 'Request Demo',
    ),
    _ProductModel(
      icon: Icons.image_search,
      name: 'ScanAI X-Ray Pro',
      tagline: 'High-Quality Imaging for Modern Clinics',
      description:
          'A high-frequency digital X-ray system delivering clear and reliable imaging results.',
      features: const [
        'High-resolution imaging',
        'DICOM compatibility',
        'Optimized for clinical use',
        'Robust performance',
      ],
      useCases: const [],
      cta: 'Contact Sales',
    ),
    _ProductModel(
      icon: Icons.precision_manufacturing,
      name: 'ScanAI X-Ray Advanced',
      tagline: 'Advanced Imaging, Real-Time Insights',
      description:
          'A premium DRF system that combines fluoroscopy and X-ray for real-time diagnostics.',
      features: const [
        'Real-time imaging (fluoroscopy)',
        'Advanced diagnostics',
        'Integrated software support',
        'Ideal for hospitals',
      ],
      useCases: const [],
      cta: 'Request Demo',
    ),
  ];
}

class _HoverProductCard extends StatefulWidget {
  const _HoverProductCard({
    required this.product,
    required this.onBuildContent,
  });

  final _ProductModel product;
  final Widget Function(BuildContext) onBuildContent;

  @override
  State<_HoverProductCard> createState() => _HoverProductCardState();
}

class _HoverProductCardState extends State<_HoverProductCard>
    with SingleTickerProviderStateMixin {
  static const Color _primary = Color(0xFF5A3182);
  static const Color _accent = Color(0xFFE063A3);

  bool _hovered = false;
  late final AnimationController _controller;
  late final Animation<double> _elevationAnim;
  late final Animation<double> _translateAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _elevationAnim = Tween<double>(begin: 3, end: 18).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _translateAnim = Tween<double>(begin: 0, end: -6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _hovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _hovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(0.0, _translateAnim.value, 0.0)
              ..scale(_scaleAnim.value),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _hovered
                      ? _accent.withOpacity(0.35)
                      : _primary.withOpacity(0.09),
                  width: _hovered ? 1.5 : 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _primary.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                  if (_hovered)
                    BoxShadow(
                      color: _primary.withOpacity(0.18),
                      blurRadius: _elevationAnim.value * 1.5,
                      spreadRadius: 0,
                      offset: Offset(0, _elevationAnim.value * 0.6),
                    ),
                  if (_hovered)
                    BoxShadow(
                      color: _accent.withOpacity(0.10),
                      blurRadius: _elevationAnim.value,
                      offset: Offset(4, _elevationAnim.value * 0.4),
                    ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Animated top accent bar
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _hovered
                              ? [_accent, _primary]
                              : [Colors.transparent, Colors.transparent],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: widget.onBuildContent(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProductModel {
  const _ProductModel({
    required this.icon,
    required this.name,
    required this.tagline,
    required this.description,
    required this.features,
    required this.useCases,
    required this.cta,
  });

  final IconData icon;
  final String name;
  final String tagline;
  final String description;
  final List<String> features;
  final List<String> useCases;
  final String cta;
}
