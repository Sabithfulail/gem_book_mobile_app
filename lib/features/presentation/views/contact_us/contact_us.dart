import 'package:flutter/material.dart';
import 'package:gem_book/utils/app_strings.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../widgets/common_appbar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CommonAppBar(
        title: AppStrings.contactUs,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are here to answer your questions and help you with any issues you may have.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildContactInfo(
                icon: Icons.phone,
                text: '+1 234-567-8900',
                onTap: () => launch('tel:+12345678900')),
            const SizedBox(height: 10),
            _buildContactInfo(
                icon: Icons.email,
                text: 'support@gembook.com',
                onTap: () => launch('mailto:support@yourapp.com')),
            const SizedBox(height: 10),
            _buildContactInfo(
                icon: Icons.alternate_email,
                text: 'info@gembook.com',
                onTap: () => launch('mailto:info@yourapp.com')),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String text,
    required void Function() onTap,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
