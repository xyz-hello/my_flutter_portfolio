import 'package:flutter/material.dart';
import 'section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  Widget experienceCard(String title, String subtitle, String description) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.tealAccent)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            const SizedBox(height: 6),
            Text(description, style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Experience', icon: Icons.work),
        const SizedBox(height: 12),
        experienceCard('Technical Support', 'Microtrade GCM Corporation • Intern, April 2019', 'Performed hardware repairs, technical support, CCTV monitoring, and demonstrated problem-solving skills.'),
        experienceCard('Mobile App Developer', 'Perati Startup Company, 2023', 'Assisted in Flutter app development, UI design, and ensured smooth user experience.'),
        experienceCard('3D Data Annotator', 'Remotasks/Outlier AI • Freelance, 2020 - 2025', 'Top 10 performer in Bee LiDAR Project. 3D data annotation and validation.'),
        const SizedBox(height: 24),
      ],
    );
  }
}
