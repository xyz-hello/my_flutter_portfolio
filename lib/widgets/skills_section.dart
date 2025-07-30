import 'package:flutter/material.dart';
import 'section_title.dart';

class SkillsSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const SkillsSection({super.key, required this.title, required this.icon, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title, icon: icon),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map((skill) => Chip(label: Text(skill))).toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
