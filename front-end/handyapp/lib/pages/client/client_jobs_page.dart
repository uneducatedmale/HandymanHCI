import 'package:flutter/material.dart';

/*
  File: client_jobs_page.dart
  Purpose:
  - Displays a list of current and past jobs for the client.

  Functionality:
  - Shows a mock list of job entries including title, status, and brief description.
  - Serves as a hub for reviewing job history and progress.

  Design:
  - Matches Handyman App aesthetic with a clean list format.
*/

class ClientJobsPage extends StatelessWidget {
  const ClientJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockJobs = [
      {
        'title': 'Kitchen Remodel',
        'status': 'In Progress',
        'description': 'Ongoing remodeling of the kitchen area.'
      },
      {
        'title': 'Roof Repair',
        'status': 'Completed',
        'description': 'Fixed roof leak and replaced shingles.'
      },
      {
        'title': 'Bathroom Plumbing',
        'status': 'Scheduled',
        'description': 'Upcoming pipe replacements and reinstallation.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Jobs'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: mockJobs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final job = mockJobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            child: ListTile(
              title: Text(job['title']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status: ${job['status']}'),
                  const SizedBox(height: 5),
                  Text(job['description']!),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
