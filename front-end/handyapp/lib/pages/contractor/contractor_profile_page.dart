import 'package:flutter/material.dart';

class ContractorProfilePage extends StatelessWidget {
  const ContractorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contractor Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profile_placeholder.png'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Licensed Contractor · Syracuse, NY',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                _buildSection(
                  title: 'Experience',
                  content: '5+ years in residential and commercial contracting, including plumbing, electrical, and general renovation work.',
                ),
                _buildSection(
                  title: 'Specializations',
                  content: '• Plumbing installations and repair\n• Electrical wiring and safety inspections\n• Interior and exterior painting\n• Kitchen and bathroom remodeling',
                ),
                _buildSection(
                  title: 'Certifications & Training',
                  content: '• Certified Electrical Technician\n• OSHA Safety Certified\n• Plumbing and HVAC License (NY)',
                ),
                _buildSection(
                  title: 'Ratings & Reviews',
                  content: 'Average Rating: 4.7/5\n“Very professional and detail-oriented.”\n“Finished ahead of schedule and under budget.”',
                ),
                _buildSection(
                  title: 'Current Projects',
                  content: '• Bathroom Remodel – Elm Street (In Progress)\n• Roof Replacement – Maple Ave (Scheduled)',
                ),
                _buildSection(
                  title: 'Contact Info',
                  content: 'Phone: (315) 555-0199\nEmail: john.doe@contractorsny.com',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}