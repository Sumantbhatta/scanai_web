import 'package:flutter/material.dart';
import 'package:scan_ai/components/About.dart';
import 'package:scan_ai/components/service.dart';
import '../components/header.dart';
import '../components/herosection.dart'; // Ensure this filename is correct
import '../components/footer.dart';
import '../components/download.dart';
import '../utils/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. The Navbar (Header)
              header(
                onNavTap: (item) => handleNavbarNavigation(context, item),
              ),

              // 2. The Video Section 
              // ✅ Removed 'const' because HeroSection has a Video Controller
              HeroSection(), 

              // 3. Other Page Content
              const DownloadSection(),
              const services(),
              const aboutsection(),
              
              // 4. The Footer
              const footer(),
            ],
          ),
        ),
      ),
    );
  }
}