import 'package:flutter/material.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Handyman App Help Guide'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🔧 Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The Handyman App helps connect clients with contractors for home improvement and repair jobs. '
              'Clients can discover professionals, track job progress, and manage ongoing projects. '
              'Contractors can handle bookings, update job timelines, and control their availability.',
            ),
            SizedBox(height: 20),
            Text(
              '👷 Client Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '• Sign in as a client to access your dashboard.\n'
              '• Use "Search Contractors" to browse available professionals by ratings, specialties, and locations.\n'
              '• Tap "Request" to send a booking inquiry.\n'
              '• Track project progress in real-time on your dashboard or through the "Project Timeline" view.\n'
              '• View updates posted by contractors and review job details at any time.',
            ),
            SizedBox(height: 20),
            Text(
              '🛠️ Contractor Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '• Sign in as a contractor to access your dashboard.\n'
              '• Manage your public profile to let clients know your expertise and experience.\n'
              '• Use the "Project Timeline" to add detailed progress reports with dates and notes.\n'
              '• Set your weekly availability so clients know when you’re free for work.\n'
              '• View your scheduled bookings and prepare ahead using the calendar view.',
            ),
            SizedBox(height: 20),
            Text(
              '❓ Need More Help?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This version of the app is a visual mockup. If you’re testing it in a class setting or demo, feel free to explore all the features without needing real credentials or live data.',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
