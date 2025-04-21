import 'package:flutter/material.dart';
import 'package:handyapp/pages/client/client_discovery_page.dart';
import 'package:handyapp/pages/client/client_jobs_page.dart';

/*
  File: client_dashboard_page.dart
  Purpose:
  - Main hub for clients after logging in.
  - Provides access to core client features like searching contractors and tracking project progress.

  Functionality:
  - Displays a welcome message and navigational buttons.
  - Opens discovery and job tracking pages directly.

  Design:
  - Matches visual theme of Handyman App with teal and white styling.
*/

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            radius: 1,
            colors: [
              Colors.white,
              Color(0xff5debd7),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Client!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClientDiscoveryPage(),
                  ),
                );
              },
              child: const Text('Search Contractors'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClientJobsPage(),
                  ),
                );
              },
              child: const Text('Track Project Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
