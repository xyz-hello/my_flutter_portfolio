import 'package:flutter/material.dart';
import 'section_title.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitle(title: 'About Me', icon: Icons.person),
        SizedBox(height: 8),
        Text('I am a passionate computer engineer who loves coding, gaming, and building meaningful apps.', style: TextStyle(color: Colors.white70)),
        SizedBox(height: 24),
      ],
    );
  }
}
