import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyapp/pages/contractor/add_progress_dialog.dart';
import 'package:handyapp/pages/contractor/edit_availability_dialog.dart';
import 'package:handyapp/pages/contractor/contractor_profile_page.dart';
import 'package:handyapp/pages/contractor/contractor_schedule_page.dart';

/*
  File: contractor_dashboard_page.dart
  Purpose:
  - Acts as the main landing page for contractors after signing in.

  Functionality:
  - Displays welcome text for the contractor.
  - Provides access to contractor-specific features like logging updates, managing availability,
    viewing/editing profile, and checking schedules.

  Design:
  - Styled consistently with the Handyman App using centered layout and elevated buttons.
*/

class ContractorDashboard extends StatelessWidget {
  const ContractorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contractor Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Contractor!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const AddProgressDialog(),
                );
              },
              child: const Text('Log Project Updates'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const EditAvailabilityDialog(),
                );
              },
              child: const Text('Manage Availability'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ContractorProfilePage());
              },
              child: const Text('View Profile'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ContractorSchedulePage());
              },
              child: const Text('View Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}

