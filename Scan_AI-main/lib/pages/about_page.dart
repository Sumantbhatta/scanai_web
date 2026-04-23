import 'package:flutter/material.dart';
import 'package:scan_ai/components/footer.dart';
import 'package:scan_ai/components/header.dart';
import 'package:scan_ai/utils/navigation.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  static const Color _primary = Color(0xFF5A3182);
  static const Color _accent = Color(0xFFE063A3);
  static const Color _softAccent = Color(0xFFC659A5);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _fadeSlide({required Widget child, required int delay}) {
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(delay * 0.1, 1.0, curve: Curves.easeOut),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - animation.value)),
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6FC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(onNavTap: (item) => handleNavbarNavigation(context, item)),

            _fadeSlide(delay: 0, child: _hero()),

            _fadeSlide(
              delay: 1,
              child: _section(
                title: 'Our Journey',
                content:
                    'ScanAI was created to make healthcare smarter, faster, and more accessible!. '
                   " ScanAI is an intelligent healthcare platform designed to assist in early disease detection and medical analysis using advanced AI technologies. "
                  "We aim to bridge the gap between accessibility and accuracy in healthcare, empowering users with reliable insights anytime, anywhere.",
              ),
            ),

            _fadeSlide(
              delay: 2,
              child: _twoColumnCards(
                leftTitle: 'Our Mission',
                leftBody:
                    'To make early diagnosis simple, affordable, and accessible using AI.',
                rightTitle: 'Our Vision',
                rightBody:
                    'To build a global healthcare ecosystem powered by AI insights.',
              ),
            ),

            _fadeSlide(
              delay: 3,
              child: _section(
                title: 'What We Do',
                content: 'AI meets healthcare in a seamless diagnostic experience.',
                bullets: const [
                  'AI-powered scan analysis',
                  'Secure health records',
                  'Device integration',
                  'Scalable healthcare system',
                ],
              ),
            ),

            _fadeSlide(
              delay: 4,
              child: _section(
                title: 'How We are Different',
                content:
                    'We combine intelligence, accessibility, and medical innovation.',
                bullets: const [
                  'Multi-disease support',
                  'Real-time AI insights',
                  'Hardware + software integration',
                  'Future-ready system',
                ],
              ),
            ),

            _fadeSlide(
              delay: 5,
              child: _section(
                title: 'Who We Serve',
                content: 'Designed for everyone in the healthcare ecosystem.',
                bullets: const [
                  'Individuals',
                  'Clinics',
                  'Doctors',
                  'Remote communities',
                ],
              ),
            ),

            _fadeSlide(
              delay: 6,
              child: _ctaCard(context),
            ),

            const footer(),
          ],
        ),
      ),
    );
  }

  // 🔥 HERO (with subtle zoom animation)
  Widget _hero() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.9, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 24, 20, 18),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_primary, _softAccent],
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: _primary.withOpacity(0.25),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transforming Healthcare with AI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'ScanAI builds intelligent healthcare solutions combining AI + devices.',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔥 SECTION
  Widget _section({
    required String title,
    required String content,
    List<String> bullets = const [],
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: _primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(content,
              style: TextStyle(color: Colors.grey.shade700, height: 1.6)),
          const SizedBox(height: 10),
          ...bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.check_circle,
                      color: _accent, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(b)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // 🔥 CTA with pulse animation
  Widget _ctaCard(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.95, end: 1),
      duration: const Duration(milliseconds: 900),
      curve: Curves.easeOutBack,
      builder: (context, double scale, child) {
        return Transform.scale(
          scale: scale,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 18, 20, 30),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [_primary, _accent]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Join the Future of Healthcare',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Be part of AI-powered healthcare innovation.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/products');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _primary,
                      ),
                      child: const Text('Explore'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/contact');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      child: const Text('Contact'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔥 TWO COLUMN (unchanged but smooth appearance)
  Widget _twoColumnCards({
    required String leftTitle,
    required String leftBody,
    required String rightTitle,
    required String rightBody,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(child: _miniCard(leftTitle, leftBody)),
          const SizedBox(width: 12),
          Expanded(child: _miniCard(rightTitle, rightBody)),
        ],
      ),
    );
  }

  Widget _miniCard(String title, String body) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: _primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: _primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(body, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}