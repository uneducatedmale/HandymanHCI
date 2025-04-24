import 'package:flutter/material.dart';

/*
  File: client_jobs_page.dart
  Purpose:
  - Displays a list of current and past jobs for the client.

  Functionality:
  - Shows a mock list of job entries including title, status, contractor, timeline, and description.
  - Serves as a hub for reviewing job history and progress.

  Design:
  - Matches Handyman App aesthetic with clean cards and dynamic project data.
*/

class ClientJobsPage extends StatelessWidget {
  const ClientJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockJobs = [
      {
        'title': 'Kitchen Remodel',
        'status': 'In Progress',
        'contractor': 'Peak Interiors',
        'timeline': 'Expected: May 1 – May 20',
        'description': 'Remodel includes new cabinets, countertop installation, backsplash tiling, and updated lighting.'
      },
      {
        'title': 'Roof Repair',
        'status': 'Completed',
        'contractor': 'Syracuse Roofing Co.',
        'timeline': 'Completed: Apr 10',
        'description': 'Fixed water leakage and replaced broken shingles across 75% of the roof.'
      },
      {
        'title': 'Bathroom Plumbing',
        'status': 'Scheduled',
        'contractor': 'Johns Plumbing',
        'timeline': 'Scheduled: May 25 – May 28',
        'description': 'Upcoming task includes replacing pipe joints, installing a new toilet and re-caulking the tub.'
      },
      {
        'title': 'Exterior Painting',
        'status': 'Pending',
        'contractor': 'Peak Painters',
        'timeline': 'Scheduled: June 3 – June 10',
        'description': 'Awaiting weather clearance. Full house repaint using weather-resistant matte coat.'
      },
      {
        'title': 'Garage Electrical Setup',
        'status': 'In Progress',
        'contractor': 'M&M Electric',
        'timeline': 'Started: Apr 25 – Expected: May 3',
        'description': 'Installing ceiling-mounted lights, outlet expansion, and sub-panel wiring for tools.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Jobs'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
      ),
      body: ListView.builder(
        itemCount: mockJobs.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final job = mockJobs[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job['title']!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Status: ${job['status']}'),
                  Text('Contractor: ${job['contractor']}'),
                  Text('Timeline: ${job['timeline']}'),
                  const SizedBox(height: 10),
                  Text(job['description']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
