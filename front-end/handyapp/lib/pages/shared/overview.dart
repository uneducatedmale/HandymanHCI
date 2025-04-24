import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 22,
        );

    final paragraphStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 16,
          height: 1.7,
          color: Colors.grey[900],
        );

    final captionStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontStyle: FontStyle.italic,
          color: Colors.grey[600],
        );

    Widget sectionTitle(String title) => Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Text(title, style: headingStyle),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Overview'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle('🔧 Introduction'),
            Text(
              'The Handyman App is a human-centered digital solution designed to connect homeowners with reliable independent contractors for renovations and repairs.\n\n'
              'Clients often face difficulties with contractor trust and transparency, while contractors struggle to organize multiple jobs and stay responsive. '
              'This app addresses both issues with centralized communication, visual progress tracking, and scheduling support. Inspired by real-world pain points, its mission is to simplify and professionalize contractor-client relationships.',
              style: paragraphStyle,
            ),

            sectionTitle('⚙️ Core Goals and Functionality'),
            Text(
              'The app revolves around three pillars:\n'
              '1. **Discover Contractors** – Search and filter based on reviews, expertise, location, and cost.\n'
              '2. **Manage Projects** – Contractors track materials, progress, and share updates.\n'
              '3. **Improve Communication** – Clients get timely notifications; contractors use intuitive tools.\n\n'
              'User feedback drove the focus on transparency, usability for older users, and efficient reporting for busy contractors.',
              style: paragraphStyle,
            ),

            sectionTitle('📊 Research and User Needs'),
            Text(
              'Research through interviews and competitive analysis revealed:\n'
              '• Clients prioritize **credentials** and **price clarity**.\n'
              '• Contractors seek **organization** and **streamlined reporting**.\n\n'
              'To meet these needs, the app offers:\n'
              '• Calendar-based availability management\n'
              '• Clear visual timelines\n'
              '• A beginner-friendly UI for tech-averse users',
              style: paragraphStyle,
            ),

            sectionTitle('👥 User Personas'),
            Text(
              '**Maria (Client)** – A 57-year-old retired teacher with minimal tech experience. Maria values transparency, clear options, and peace of mind during projects.\n\n'
              '**David (Contractor)** – A 38-year-old independent tradesman who needs to juggle job sites. David values efficiency, mobile task tools, and client credibility to win repeat business.',
              style: paragraphStyle,
            ),

            sectionTitle('🎨 Design Philosophy'),
            Text(
              'The UI follows inclusive and accessible design standards:\n'
              '• Readable fonts, minimal clutter, and visual hierarchy\n'
              '• Screen reader compatibility\n'
              '• Language and budget accessibility\n\n'
              'Unlike platforms focused on gig-style bidding, this app encourages ongoing partnerships with profiles, review systems, and visual job portfolios.',
              style: paragraphStyle,
            ),

            sectionTitle('📖 Storyboard'),
            Image.asset(
              'assets/images/Storyboard.png',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              'Figure: A storyboard showing a user navigating contractor discovery, managing project progress, and resolving a scheduling conflict.',
              style: captionStyle,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
