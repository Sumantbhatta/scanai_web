import 'package:flutter/material.dart';
import '../pages/download_page.dart';

class downloadsection extends StatelessWidget {
  const downloadsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF5A3182).withOpacity(0.95),
            const Color(0xFFC659A5).withOpacity(0.95),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _content(context, isMobile),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _content(context, isMobile),
                );
        },
      ),
    );
  }

  List<Widget> _content(BuildContext context, bool isMobile) {
    Widget textSection = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          "Download Our App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Book appointments, track health & get care anytime, anywhere.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style:
              const TextStyle(color: Colors.white70, fontSize: 15, height: 1.6),
        ),
        const SizedBox(height: 24),

        // ✅ FIXED BUTTON
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF5A3182),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DownloadPage(),
              ),
            );
          },
          child: const Text("Download Now"),
        ),
      ],
    );

    Widget imageSection = Image.asset(
      "assets/download.jpg",
      height: 200,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image_not_supported,
            color: Colors.white, size: 80);
      },
    );

    return isMobile
        ? [
            textSection,
            const SizedBox(height: 30),
            imageSection,
          ]
        : [
            Expanded(child: textSection),
            imageSection,
          ];
  }
}
