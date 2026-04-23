import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../utils/navigation.dart'; // ✅ Added import for navigation

class herosection extends StatefulWidget {
  const herosection({super.key});

  @override
  State<herosection> createState() => _herosectionState();
}

class _herosectionState extends State<herosection> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // ✅ Ensure you renamed the file to scan_ai_video.mp4 in assets
    _controller = VideoPlayerController.asset("assets/scan_ai_video.mp4")
      ..initialize().then((_) {
        _controller.setVolume(0.0);
        _controller.setLooping(true);
        _controller.play();
        setState(() => _isInitialized = true);
      }).catchError((e) => debugPrint("Video Error: $e"));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Color(0xFF5A3182)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          
          Container(color: Colors.black.withOpacity(0.4)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Empowering Hearts\nEnriching Lives",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // ✅ Fixed: Now redirects to the product page
                    handleNavbarNavigation(context, 'products');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A3182),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("View Products →"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}