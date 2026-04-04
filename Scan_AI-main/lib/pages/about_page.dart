import 'package:flutter/material.dart';
import 'package:scan_ai/components/footer.dart';
import 'package:scan_ai/components/header.dart';
import 'package:scan_ai/utils/navigation.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color _primary = Color(0xFF5A3182);
  static const Color _accent = Color(0xFFE063A3);
  static const Color _softAccent = Color(0xFFC659A5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(onNavTap: (item) => handleNavbarNavigation(context, item)),
            _hero(),
            _section(
              title: 'Our Journey',
              content:
                  'ScanAI was born from a simple idea healthcare diagnostics should be accessible, intelligent, and available to everyone, everywhere.\n\nWhile traditional systems are often limited to hospitals and expensive setups, we envisioned a platform that bridges the gap between advanced medical technology and everyday users.\n\nBy integrating AI with portable diagnostic devices, ScanAI aims to empower individuals, clinics, and healthcare providers with faster insights and smarter decision-making tools.',
            ),
            _twoColumnCards(
              leftTitle: 'Our Mission',
              leftBody:
                  'To make early diagnosis simple, affordable, and accessible through AI-powered healthcare solutions.',
              rightTitle: 'Our Vision',
              rightBody:
                  'To become a global platform where AI and medical devices work together to deliver real-time, accurate, and life-saving insights.',
            ),
            _section(
              title: 'What We Do',
              content:
                  'ScanAI combines cutting-edge artificial intelligence with modern medical devices to deliver a seamless healthcare experience.',
              bullets: const [
                'AI-based analysis of medical scans (ECG, X-ray, and more)',
                'Secure storage and tracking of health reports',
                'Integration with portable diagnostic devices',
                'Scalable solutions for both individuals and healthcare providers',
              ],
            ),
            _section(
              title: 'How We are Different',
              content:
                  'Unlike traditional healthcare apps that focus on a single function, ScanAI is designed as a unified ecosystem.',
              bullets: const [
                'Multi-disease support instead of single-condition focus',
                'AI-driven insights for faster decision-making',
                'Device + Software integration in one platform',
                'Scalable architecture for future healthcare innovations',
              ],
            ),
            _section(
              title: 'Who We Serve',
              content: 'ScanAI is built for a wide range of users.',
              bullets: const [
                'Individuals monitoring their personal health',
                'Clinics and diagnostic centers',
                'Healthcare startups and professionals',
                'Remote and underserved communities',
              ],
            ),
            _section(
              title: 'Looking Ahead',
              content: 'We are continuously working to enhance ScanAI by.',
              bullets: const [
                'Integrating real AI models for advanced diagnostics',
                'Expanding device compatibility (ECG, imaging, and more)',
                'Enabling real-time monitoring and alerts',
                'Building a global healthcare ecosystem',
              ],
            ),
            _ctaCard(context),
            const footer(),
          ],
        ),
      ),
    );
  }

  Widget _hero() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 22, 20, 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_primary.withOpacity(0.98), _softAccent.withOpacity(0.95)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transforming Healthcare with AI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'ScanAI is building a smarter, more accessible future for medical diagnostics combining artificial intelligence with portable healthcare devices.',
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    required String content,
    List<String> bullets = const [],
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _primary,
              fontSize: 33,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              height: 1.75,
            ),
          ),
          if (bullets.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...bullets.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Icon(Icons.check_circle, color: _accent, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 15,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ],
      ),
    );
  }

  Widget _twoColumnCards({
    required String leftTitle,
    required String leftBody,
    required String rightTitle,
    required String rightBody,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 900;
          final children = [
            Expanded(
              child: _miniCard(title: leftTitle, body: leftBody),
            ),
            SizedBox(width: isMobile ? 0 : 12, height: isMobile ? 12 : 0),
            Expanded(
              child: _miniCard(title: rightTitle, body: rightBody),
            ),
          ];

          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children);
        },
      ),
    );
  }

  Widget _miniCard({required String title, required String body}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(color: _primary.withOpacity(0.04)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: _primary,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              height: 1.65,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ctaCard(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [_primary.withOpacity(0.96), _accent.withOpacity(0.9)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          const Text(
            'Join Us in Redefining Healthcare',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Whether you are a user, healthcare professional, or innovator, ScanAI invites you to be part of the future of intelligent healthcare.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 18),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _accent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                ),
                child: const Text('Explore Products'),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/contact');
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                ),
                child: const Text('Contact Us'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
