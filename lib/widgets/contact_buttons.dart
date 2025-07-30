import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'section_title.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key});

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Contact Me', icon: Icons.contact_mail),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(onPressed: () => _launchUrl('mailto:palahuddinalkhalid@gmail.com'), icon: const Icon(Icons.email), label: const Text('Email')),
            ElevatedButton.icon(onPressed: () => _launchUrl('https://github.com/xyz-hello'), icon: const FaIcon(FontAwesomeIcons.github), label: const Text('GitHub')),
            ElevatedButton.icon(onPressed: () => _launchUrl('https://facebook.com/m_aqsam'), icon: const Icon(Icons.facebook), label: const Text('Facebook')),
            ElevatedButton.icon(onPressed: () => _launchUrl('https://www.linkedin.com/in/palahuddinmuksan/'), icon: const FaIcon(FontAwesomeIcons.linkedin), label: const Text('LinkedIn Profile')),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
