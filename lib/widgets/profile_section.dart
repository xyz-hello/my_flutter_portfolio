import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(radius: 80, backgroundImage: AssetImage('assets/profile.png')),
        SizedBox(height: 16),
        Text('   Al Khalid Muksan Palahuddin', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
        SizedBox(height: 8),
        Text('@hello.xyz', style: TextStyle(color: Colors.tealAccent)),
        SizedBox(height: 16),
        Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.school, size: 16, color: Colors.white70), SizedBox(width: 4), Text('Computer Engineering', style: TextStyle(color: Colors.white70))]),
        Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.location_on, size: 16, color: Colors.white70), SizedBox(width: 4), Text('Cagayan De Oro City', style: TextStyle(color: Colors.white70))]),
        SizedBox(height: 24),
      ],
    );
  }
}
