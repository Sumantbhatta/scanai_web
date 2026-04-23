import 'package:flutter/material.dart';
import '../components/header.dart';
import '../components/herosection.dart';
import '../components/footer.dart';
import '../components/download.dart';
import '../utils/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // SafeArea prevents the content from going under the status bar or notch
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 1. The Navbar (Header)
              header(
                onNavTap: (item) => handleNavbarNavigation(context, item),
              ),

              // 2. The Video Section
              const herosection(),

              // 3. Other Page Content
              const DownloadSection(),

              // 4. The Footer
              const footer(),
            ],
          ),
        ),
      ),
    );
  }
}