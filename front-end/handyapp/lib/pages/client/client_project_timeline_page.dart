import 'package:flutter/material.dart';

/*
  File: client_project_timeline_page.dart
  Purpose:
  - Shows a clear, friendly progress tracker for a client’s ongoing project.

  Functionality:
  - Displays project milestones with descriptions, statuses, and contact cues.
  - Designed to give clients peace of mind and transparency.
*/

class ClientProjectTimelinePage extends StatelessWidget {
  const ClientProjectTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> clientTimeline = [
      {
        'title': 'Project Accepted',
        'status': 'Complete',
        'date': 'Apr 1, 2025',
        'summary':
            'You approved the contractor quote. Materials and scheduling have begun.',
      },
      {
        'title': 'Prep & Inspection',
        'status': 'Complete',
        'date': 'Apr 3, 2025',
        'summary':
            'Contractor visited your property, performed measurements, and finalized the checklist for upcoming work.',
      },
      {
        'title': 'Work Began',
        'status': 'In Progress',
        'date': 'Apr 6, 2025',
        'summary':
            'Framing and wall prep are underway. You’ll receive updates with photos daily. Estimated completion in 12 days.',
      },
      {
        'title': 'Midpoint Review',
        'status': 'Upcoming',
        'date': 'Apr 13, 2025',
        'summary':
            'You’ll meet with the contractor to review progress, raise concerns, and adjust scope if needed.',
      },
      {
        'title': 'Painting & Finish Work',
        'status': 'Pending',
        'date': 'Apr 17, 2025',
        'summary':
            'Painters and electricians begin detail work. You can request touch-ups after walkthrough.',
      },
      {
        'title': 'Final Review & Cleanup',
        'status': 'Pending',
        'date': 'Apr 20, 2025',
        'summary':
            'Contractor will walk you through everything, ensure all punch list items are resolved, and clean the site.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Project Timeline'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: clientTimeline.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = clientTimeline[index];
            final statusColor = _statusColor(item['status']!);

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 12, color: statusColor),
                        const SizedBox(width: 8),
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          item['date']!,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['summary']!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Chip(
                        label: Text(item['status']!),
                        backgroundColor: statusColor.withOpacity(0.15),
                        labelStyle: TextStyle(color: statusColor),
                        shape: StadiumBorder(
                          side: BorderSide(color: statusColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Complete':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      case 'Upcoming':
      case 'Pending':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }
}
