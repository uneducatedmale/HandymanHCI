import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyapp/pages/contractor/contractor_profile_page.dart';
import 'package:handyapp/pages/contractor/contractor_schedule_page.dart';
import 'package:handyapp/pages/contractor/contractor_project_timeline_page.dart';

class ContractorDashboard extends StatelessWidget {
  const ContractorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contractor Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            DashboardTile(
              icon: Icons.timeline,
              label: 'View Project Timeline',
              actionType: DashboardAction.route,
              routeWidget: ContractorProjectTimelinePage(),
            ),
            DashboardTile(
              icon: Icons.person,
              label: 'View Profile',
              actionType: DashboardAction.route,
              routeWidget: ContractorProfilePage(),
            ),
            DashboardTile(
              icon: Icons.calendar_month,
              label: 'View Schedule',
              actionType: DashboardAction.route,
              routeWidget: ContractorSchedulePage(),
            ),
          ],
        ),
      ),
    );
  }
}

enum DashboardAction { dialog, route }

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final DashboardAction actionType;
  final Widget? dialogBuilder;
  final Widget? routeWidget;

  const DashboardTile({
    super.key,
    required this.icon,
    required this.label,
    required this.actionType,
    this.dialogBuilder,
    this.routeWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (actionType == DashboardAction.dialog && dialogBuilder != null) {
          showDialog(context: context, builder: (_) => dialogBuilder!);
        } else if (actionType == DashboardAction.route && routeWidget != null) {
          Get.to(() => routeWidget!);
        }
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
