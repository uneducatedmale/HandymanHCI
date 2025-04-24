import 'package:flutter/material.dart';
import 'package:handyapp/pages/client/client_discovery_page.dart';
import 'package:handyapp/pages/client/client_jobs_page.dart';
import 'package:handyapp/pages/client/client_project_timeline_page.dart';

class ClientDashboard extends StatelessWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            DashboardTile(
              icon: Icons.search,
              label: 'Find Contractors',
              routeBuilder: ClientDiscoveryPage(),
            ),
            DashboardTile(
              icon: Icons.assignment,
              label: 'Your Projects',
              routeBuilder: ClientJobsPage(),
            ),
            DashboardTile(
              icon: Icons.timeline,
              label: 'Project Timeline',
              routeBuilder: ClientProjectTimelinePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget routeBuilder;

  const DashboardTile({
    required this.icon,
    required this.label,
    required this.routeBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => routeBuilder),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
