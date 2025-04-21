import 'package:flutter/material.dart';
import 'package:handyapp/pages/client/booking_request_dialog.dart';

/*
  File: client_discovery_page.dart
  Purpose:
  - Allows clients to discover and search for contractors.

  Functionality:
  - Displays a list of contractor cards with basic info.
  - Each card includes name, rating, and description.
  - Includes a search bar and filter dropdown (static for mockup).
  - Tapping "Request" opens the booking dialog for that contractor.

  Design:
  - Styled consistently with the Handyman App using elevated cards and teal accents.
*/

class ClientDiscoveryPage extends StatelessWidget {
  const ClientDiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contractors = [
      {
        'name': 'Johns Plumbing',
        'rating': 4.8,
        'desc': 'Over 10 years of residential plumbing experience.'
      },
      {
        'name': 'M&M Electric',
        'rating': 4.5,
        'desc': 'Licensed electricians specializing in indoor rewiring.'
      },
      {
        'name': 'Peak Painters',
        'rating': 4.9,
        'desc': 'Top-rated for fast, high-quality indoor and outdoor painting.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Contractors'),
        backgroundColor: Colors.teal,
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
                DropdownMenuItem(
                    value: 'Most Affordable', child: Text('Most Affordable')),
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
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text(contractor['name'] as String),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contractor['desc'] as String),
                          const SizedBox(height: 5),
                          Text('⭐ ${contractor['rating']}'),
                        ],
                      ),
                      trailing: ElevatedButton(
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
