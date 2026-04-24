import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final dynamic product;

  const ProductDetailPage({super.key, required this.product});

  static const Color _primary = Color(0xFF5A3182);
  static const Color _accent = Color(0xFFE063A3);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: _primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  // IMAGE + DESCRIPTION
                  isMobile
                      ? Column(
                          children: [
                            _imageCard(context),
                            const SizedBox(height: 20),
                            _descriptionCard(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _imageCard(context)),
                            const SizedBox(width: 20),
                            Expanded(child: _descriptionCard()),
                          ],
                        ),

                  const SizedBox(height: 30),

                  // VIDEO + DESCRIPTION
                  isMobile
                      ? Column(
                          children: [
                            _videoCard(),
                            const SizedBox(height: 20),
                            _videoDescriptionCard(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _videoCard()),
                            const SizedBox(width: 20),
                            Expanded(child: _videoDescriptionCard()),
                          ],
                        ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 🔥 IMAGE CARD (FIXED)
  Widget _imageCard(BuildContext context) {
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Buying ${product.name}..."),
                    ),
                  );
                },
                child: Text(product.cta),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DESCRIPTION CARD
  Widget _descriptionCard() {
    return HoverCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              product.tagline,
              style: const TextStyle(color: _accent),
            ),
            const SizedBox(height: 12),
            Text(product.description),

            const SizedBox(height: 20),

            const Text(
              "Key Features",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _primary,
              ),
            ),
            const SizedBox(height: 10),

            ...product.features.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "• ${f['title']}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(f['desc'] ?? ""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _videoCard() {
    return HoverCard(
      child: Container(
        height: 220,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.play_circle_outline, size: 60),
            SizedBox(height: 10),
            Text("Product Demo Video Coming Soon"),
          ],
        ),
      ),
    );
  }

  Widget _videoDescriptionCard() {
    return HoverCard(
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "This demo video will showcase how the product works in real-time, "
          "including setup, usage, and key functionalities.",
        ),
      ),
    );
  }
}

// HOVER CARD
class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        child: Card(
          elevation: isHover ? 14 : 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}