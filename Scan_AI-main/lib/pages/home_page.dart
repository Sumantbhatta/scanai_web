import 'package:flutter/material.dart';
import 'package:scan_ai/components/download.dart';
import 'package:scan_ai/components/footer.dart';
import 'package:scan_ai/utils/navigation.dart';
import '../components/herosection.dart';
import '../components/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(
              onNavTap: (item) => handleNavbarNavigation(context, item),
            ),
            herosection(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Text(
                'Download our app and start your healthcare journey with ScanAI.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5A3182),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            downloadsection(),
            const footer(),
          ],
        ),
      ),
    );
  }
}
