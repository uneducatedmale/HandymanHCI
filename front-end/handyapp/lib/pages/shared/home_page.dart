import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handyapp/pages/shared/sign_in_dialog.dart';
import 'package:handyapp/pages/shared/create_account_dialog.dart';
import 'package:handyapp/pages/shared/overview.dart';
import 'package:handyapp/pages/shared/help_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.help_outline, size: 30),
              tooltip: 'Help',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const HelpDialog(),
                );
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Handyman App',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                const Text(
                  '"For those who need (or are) the handiest "',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Serif',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const SignInDialog(userType: 'client'),
                    );
                  },
                  child: const Text('Client Sign In'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const SignInDialog(userType: 'contractor'),
                    );
                  },
                  child: const Text('Contractor Sign In'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const CreateAccountDialog(),
                    );
                  },
                  child: const Text('Create Account'),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const OverviewPage());
                  },
                  child: const Text('Overview'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
