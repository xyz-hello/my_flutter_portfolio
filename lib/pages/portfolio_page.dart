import 'package:flutter/material.dart';
import '../widgets/profile_section.dart';
import '../widgets/contact_buttons.dart';
import '../widgets/about_me.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/certificates_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: const [
              ProfileSection(),
              ContactButtons(),
              AboutMe(),
              SkillsSection(title: 'Tools', icon: Icons.build, skills: ['Google Sheets', 'Zendesk', 'Airtable', 'Jira', 'Google Docs']),
              SkillsSection(title: 'Technical Skills', icon: Icons.computer, skills: ['Flutter', 'Dart', 'React.js', 'AI Validation', 'MySQL', 'Python', 'JavaScript', 'Networking']),
              SkillsSection(title: 'Soft Skills', icon: Icons.people, skills: ['Adaptability', 'Communication', 'Time Management', 'Organizational Skills']),
              ExperienceSection(),
              CertificatesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
