import 'package:flutter/material.dart';
import 'section_title.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final certificates = [
      ['Cybercrime Caravan', 'DICT-CICC, USTP • Aug 10, 2017'],
      ['Cybercrime Prevention Act of 2012', 'Liceo De Cagayan Univ • Aug 20, 2019'],
      ['CISCO Networks and IP Telephony', 'Rivan IT, Cebu • Dec 7, 2019'],
      ['EF SET English Certificate', 'C2 Proficient (75/100) • Dec 2024'],
      ['General LiDAR Training', 'Top 5 Performer • Feb 2020'],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Certificates', icon: Icons.workspace_premium),
        const SizedBox(height: 12),
        ...certificates.map((cert) => Card(
              child: ListTile(
                title: Text(cert[0], style: const TextStyle(color: Colors.tealAccent)),
                subtitle: Text(cert[1], style: const TextStyle(color: Colors.white70)),
              ),
            )),
        const SizedBox(height: 24),
      ],
    );
  }
}
