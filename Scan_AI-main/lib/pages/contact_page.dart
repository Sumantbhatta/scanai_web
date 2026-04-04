import 'package:flutter/material.dart';
import 'package:scan_ai/components/footer.dart';
import 'package:scan_ai/components/header.dart';
import 'package:scan_ai/utils/navigation.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String _inquiryType = 'General Inquiry';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thanks! Your message has been submitted successfully.'),
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _messageController.clear();
    setState(() {
      _inquiryType = 'General Inquiry';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(onNavTap: (item) => handleNavbarNavigation(context, item)),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 22, 20, 18),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF5A3182).withOpacity(0.98),
                    const Color(0xFFE063A3).withOpacity(0.92),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Speak with ScanAI for product details, demos, and support.',
                    style: TextStyle(
                        color: Colors.white70, fontSize: 15, height: 1.6),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isMobile = constraints.maxWidth < 900;
                  if (isMobile) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _contactInfoPanel(),
                        const SizedBox(height: 20),
                        _contactFormPanel(),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _contactInfoPanel()),
                      const SizedBox(width: 24),
                      Expanded(flex: 2, child: _contactFormPanel()),
                    ],
                  );
                },
              ),
            ),
            const footer(),
          ],
        ),
      ),
    );
  }

  Widget _contactInfoPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactLine(
          icon: Icons.email_outlined,
          title: 'Email',
          value: 'hello@scanai.health',
        ),
        _contactLine(
          icon: Icons.phone_outlined,
          title: 'Phone',
          value: '+91 98765 43210',
        ),
        _contactLine(
          icon: Icons.location_on_outlined,
          title: 'Address',
          value: 'Bengaluru, India',
        ),
      ],
    );
  }

  Widget _contactFormPanel() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF5A3182).withOpacity(0.14)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send us a message',
              style: TextStyle(
                color: Color(0xFF5A3182),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Our team usually responds within 24 hours.',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
            ),
            const SizedBox(height: 16),
            _inputField(
              controller: _nameController,
              label: 'Full Name',
              hint: 'Enter your full name',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            _inputField(
              controller: _emailController,
              label: 'Email',
              hint: 'you@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            _inputField(
              controller: _phoneController,
              label: 'Phone Number',
              hint: '+91 98xxxxxx',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            const Text(
              'Inquiry Type',
              style: TextStyle(
                color: Color(0xFF5A3182),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _inquiryType,
              decoration: _fieldDecoration('Select inquiry type'),
              items: const [
                DropdownMenuItem(
                  value: 'General Inquiry',
                  child: Text('General Inquiry'),
                ),
                DropdownMenuItem(
                  value: 'Product Demo',
                  child: Text('Product Demo'),
                ),
                DropdownMenuItem(
                  value: 'Sales',
                  child: Text('Sales'),
                ),
                DropdownMenuItem(
                  value: 'Support',
                  child: Text('Support'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _inquiryType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 12),
            _inputField(
              controller: _messageController,
              label: 'Message',
              hint: 'How can we help you?',
              maxLines: 4,
              validator: (value) {
                if (value == null || value.trim().length < 10) {
                  return 'Please enter at least 10 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE063A3),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: const Text(
                  'Submit Inquiry',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF5A3182),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: _fieldDecoration(hint),
        ),
      ],
    );
  }

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            BorderSide(color: const Color(0xFF5A3182).withOpacity(0.25)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: const Color(0xFF5A3182).withOpacity(0.2)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Color(0xFF5A3182), width: 1.2),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  Widget _contactLine({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFF5A3182).withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE063A3).withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF5A3182), size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF5A3182),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
