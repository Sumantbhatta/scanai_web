import 'package:flutter/material.dart';
import '../pages/download_page.dart';

class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF5A3182),
            Color(0xFFC659A5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Download Our App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Get access to smart healthcare anytime, anywhere.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),

          /// ✅ Cards Section (Web Version Removed)
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              _buildCard("Android App", Icons.android, context),
              _buildCard("iOS App", Icons.phone_iphone, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, BuildContext context) {
    return _HoverCard(
      child: Container(
        width: 260, // slightly increased for better balance with 2 cards
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 50,
              color: const Color(0xFF5A3182),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A3182),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DownloadPage(),
                  ),
                );
              },
              child: const Text("Download"),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔥 Hover Effect Widget (2D lift + scale)
class _HoverCard extends StatefulWidget {
  final Widget child;

  const _HoverCard({required this.child});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}