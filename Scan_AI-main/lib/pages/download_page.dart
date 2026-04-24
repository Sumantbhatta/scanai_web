import 'package:flutter/material.dart';
import 'package:scan_ai/utils/navigation.dart';
import '../components/header.dart';
import '../components/footer.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  static const Color _primary = Color(0xFF5A3182);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3F7),
      body: SafeArea(
        child: Column(
          children: [
            header(
              onNavTap: (item) => handleNavbarNavigation(context, item),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        "Available on Your Favorite Platform",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: _primary),
                      ),
                      const SizedBox(height: 48),
                      
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final bool isWide = constraints.maxWidth > 600;
                          final cards = [
                            _HoverDownloadCard(
                              icon: Icons.apple,
                              title: 'iOS App',
                              subtitle: 'For iPhone and iPad',
                              buttonLabel: 'Download on App Store',
                            ),
                            if (isWide) const SizedBox(width: 24),
                            if (!isWide) const SizedBox(height: 20),
                            _HoverDownloadCard(
                              icon: Icons.android,
                              title: 'Android App',
                              subtitle: 'For Android devices',
                              buttonLabel: 'Download on Play Store',
                            ),
                          ];

                          return isWide
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: cards.map((c) => c is SizedBox ? c : Expanded(child: c)).toList(),
                                )
                              : Column(children: cards);
                        },
                      ),

                      const SizedBox(height: 60),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _StatItem(icon: Icons.public, title: "350M+", subtitle: "Users"),
                          SizedBox(width: 40),
                          _StatItem(icon: Icons.lock, title: "Secure", subtitle: "Private"),
                        ],
                      ),
                      const SizedBox(height: 60),
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
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _StatItem({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFF5A3182), size: 28),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
      ],
    );
  }
}

class _HoverDownloadCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonLabel;
  const _HoverDownloadCard({required this.icon, required this.title, required this.subtitle, required this.buttonLabel});

  @override
  State<_HoverDownloadCard> createState() => _HoverDownloadCardState();
}

class _HoverDownloadCardState extends State<_HoverDownloadCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered ? (Matrix4.identity()..scale(1.03)..translate(0, -5)) : Matrix4.identity(),
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered ? const Color(0xFF5A3182).withOpacity(0.15) : const Color(0xFF5A3182).withOpacity(0.08),
              blurRadius: isHovered ? 25 : 16,
              offset: isHovered ? const Offset(0, 10) : const Offset(0, 4),
            ),
          ],
          border: Border.all(color: const Color(0xFF5A3182).withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Icon(widget.icon, size: 48, color: const Color(0xFF5A3182)),
            const SizedBox(height: 20),
            Text(widget.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(widget.subtitle, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5A3182),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(widget.buttonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}