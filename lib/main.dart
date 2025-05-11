import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E2C),
        primaryColor: const Color(0xFF00BFA6),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00BFA6),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        cardColor: const Color(0xFF2A2A40),
        chipTheme: ChipThemeData(
          backgroundColor: const Color(0xFF2A2A40),
          labelStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      home: const PortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  bool _showScrollToTopButton = false; // Track button visibility

  // Scroll listener to toggle button visibility
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showScrollToTopButton = _scrollController.offset > 300;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget sectionTitle(String title, IconData icon, {Color iconColor = Colors.tealAccent}) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget buildProfileSection() {
    return Column(
      children: [
        // Profile Image without error handling
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/profile.png'),
        ),
        const SizedBox(height: 16),
        Text(
          '   Al Khalid Muksan Palahuddin',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Text('@hello.xyz', style: TextStyle(color: Colors.tealAccent)),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.school, size: 16, color: Colors.white70),
                SizedBox(width: 4),
                Text('Computer Engineering', style: TextStyle(color: Colors.white70)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.location_on, size: 16, color: Colors.white70),
                SizedBox(width: 4),
                Text('Cagayan De Oro City', style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildContactButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle('Contact Me', Icons.contact_mail),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _launchUrl('mailto:palahuddinalkhalid@gmail.com'),
              icon: const Icon(Icons.email),
              label: const Text('Email'),
            ),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('https://github.com/xyz-hello'),
              icon: const FaIcon(FontAwesomeIcons.github),
              label: const Text('GitHub'),
            ),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('https://facebook.com/m_aqsam'),
              icon: const Icon(Icons.facebook),
              label: const Text('Facebook'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _launchUrl('https://www.linkedin.com/in/palahuddinmuksan/'),
              icon: const FaIcon(FontAwesomeIcons.linkedin),
              label: const Text('LinkedIn Profile'),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildAboutMe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle('About Me', Icons.person),
        const SizedBox(height: 8),
        const Text(
          'I am a passionate computer engineer who loves coding, gaming, and building meaningful apps.',
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget buildSkillsSection(String title, IconData icon, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle(title, icon),
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

  Widget buildExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle('Experience', Icons.work),
        const SizedBox(height: 12),
        experienceCard(
          'Technical Support',
          'Microtrade GCM Corporation • Intern, April 2019',
          'Performed hardware repairs, technical support, CCTV monitoring, and demonstrated problem-solving skills.',
        ),
        experienceCard(
          'Mobile App Developer',
          'Perati Startup Company, 2023',
          'Assisted in Flutter app development, UI design, and ensured smooth user experience.',
        ),
        experienceCard(
          '3D Data Annotator',
          'Remotasks/Outlier AI • Freelance, 2020 - 2025',
          'Top 10 performer in Bee LiDAR Project. 3D data annotation and validation.',
        ),
        const SizedBox(height: 24),
      ],
    );
  }

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

  Widget buildCertificates() {
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
        sectionTitle('Certificates', Icons.workspace_premium),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating button that appears after scrolling 300px
      floatingActionButton: _showScrollToTopButton
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF00BFA6),
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildProfileSection(),
              buildContactButtons(),
              buildAboutMe(),
              buildSkillsSection('Tools', Icons.build, ['Google Sheets', 'Zendesk', 'Airtable', 'Jira', 'Google Docs']),
              buildSkillsSection('Technical Skills', Icons.computer,
                  ['Flutter', 'Dart', 'React.js', 'AI Validation', 'MySQL', 'Python', 'JavaScript', 'Networking']),
              buildSkillsSection('Soft Skills', Icons.people,
                  ['Adaptability', 'Communication', 'Time Management', 'Organizational Skills']),
              buildExperience(),
              buildCertificates(),
            ],
          ),
        ),
      ),
    );
  }
}
