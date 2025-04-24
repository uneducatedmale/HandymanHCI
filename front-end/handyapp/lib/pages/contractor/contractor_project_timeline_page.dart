import 'package:flutter/material.dart';

class ContractorProjectTimelinePage extends StatelessWidget {
  const ContractorProjectTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockTimeline = [
      {
        'title': 'Initial Client Meeting',
        'status': 'Completed',
        'date': 'Apr 1, 2025',
        'details':
            'Discussed project requirements, walked through the site, and noted client expectations for both materials and final look. Established communication plan.'
      },
      {
        'title': 'Site Inspection & Measurement',
        'status': 'Completed',
        'date': 'Apr 3, 2025',
        'details':
            'Performed full property inspection, took measurements of the work area, assessed potential obstacles, and ensured compliance with local building codes.'
      },
      {
        'title': 'Material Procurement',
        'status': 'In Progress',
        'date': 'Apr 5, 2025',
        'details':
            'Supplies being sourced from HomeDepot and contractor warehouses. Awaiting delivery of custom granite countertops and weather-treated wood panels.'
      },
      {
        'title': 'Foundation & Framing Prep',
        'status': 'Pending',
        'date': 'Apr 9, 2025',
        'details':
            'Framing layout planned. Contractor team will lay base materials, mark dimensions on site, and ensure that weather conditions are optimal for framing to begin.'
      },
      {
        'title': 'Client Midpoint Review',
        'status': 'Pending',
        'date': 'Apr 15, 2025',
        'details':
            'A scheduled walkthrough with the client to review progress. The contractor will present photos, issues encountered, and make adjustment proposals.'
      },
      {
        'title': 'Painting & Electrical Installation',
        'status': 'Pending',
        'date': 'Apr 20, 2025',
        'details':
            'Electricians will install sockets and switches while painters begin priming walls. Tasks will be staggered across zones to prevent overlap.'
      },
      {
        'title': 'Final Inspection & Clean-up',
        'status': 'Pending',
        'date': 'Apr 25, 2025',
        'details':
            'Final inspection with client and foreman. Checklist of milestones signed off. Clean-up crew will restore the site and remove leftover materials.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Timeline'),
        actions: [
          IconButton(
            tooltip: 'Add New Progress',
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add Progress (mocked)')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockTimeline.length,
        itemBuilder: (context, index) {
          final item = mockTimeline[index];
          final statusColor = _statusColor(item['status']!);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, color: statusColor, size: 14),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['title']!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Text(
                        item['date']!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Edit "${item['title']}" (mocked)'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['details']!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withAlpha(30), // approx 12% opacity
                      border: Border.all(color: statusColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      item['status']!,
                      style: TextStyle(color: statusColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'In Progress':
        return Colors.orange;
      case 'Pending':
      default:
        return Colors.grey.shade600;
    }
  }
}

