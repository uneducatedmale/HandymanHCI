import 'package:flutter/material.dart';
import 'package:handyapp/pages/client/booking_request_dialog.dart';

class ClientDiscoveryPage extends StatelessWidget {
  const ClientDiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contractors = [
      {
        'name': 'Johns Plumbing',
        'rating': 4.8,
        'desc': 'Over 10 years of residential plumbing experience. Handles emergency calls, sink repairs, and water heater installations.',
        'badge': '🇺🇸 Veteran-Owned',
      },
      {
        'name': 'M&M Electric',
        'rating': 4.5,
        'desc': 'Licensed electricians specializing in full-home rewiring, panel upgrades, and smart home installations.',
        'badge': '✊🏿 Black-Owned',
      },
      {
        'name': 'Peak Painters',
        'rating': 4.9,
        'desc': 'Top-rated for detailed indoor/outdoor painting. Eco-friendly paints and fast turnaround with excellent reviews.',
        'badge': '🇺🇦 Ukrainian Supporter',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Contractors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, skill, location...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: 'Top Rated',
              items: const [
                DropdownMenuItem(value: 'Top Rated', child: Text('Top Rated')),
                DropdownMenuItem(value: 'Most Affordable', child: Text('Most Affordable')),
                DropdownMenuItem(value: 'Nearest', child: Text('Nearest')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Sort by',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contractors.length,
                itemBuilder: (context, index) {
                  final contractor = contractors[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: const CircleAvatar(
                              backgroundColor: Colors.teal,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            title: Text(contractor['name'] as String),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Text(contractor['desc'] as String),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text('⭐ ${contractor['rating']}'),
                                    const SizedBox(width: 12),
                                    Chip(
                                      label: Text(contractor['badge'] as String),
                                      backgroundColor: Colors.teal.withOpacity(0.1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.info_outline),
                              tooltip: 'View Profile (mock)',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Profile view coming soon (mocked).'),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => BookingRequestDialog(
                                    contractorName: contractor['name'] as String,
                                  ),
                                );
                              },
                              child: const Text('Request'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
