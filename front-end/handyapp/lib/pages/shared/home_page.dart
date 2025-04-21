import 'package:flutter/material.dart';
import 'package:handyapp/pages/shared/sign_in_dialog.dart';
import 'package:handyapp/pages/shared/create_account_dialog.dart';

/*
  File: home_page.dart
  Purpose:
  - Entry point for the HCI version of the Handyman App.
  - Lets users choose between Client and Contractor login flows.

  Functionality:
  - Displays the app name and a tagline.
  - Offers separate sign-in buttons for Client and Contractor roles.
  - Launches the respective sign-in and account creation dialogs when clicked.

  Design:
  - Uses a radial gradient for visual consistency with original Handyman App.
  - Buttons and layout maintain centered structure for clarity and focus.
*/

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
                  '"For the handiest of men (and women too!)"',
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
                  child: const Text('Client Sign In'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const SignInDialog(userType: 'client'),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('Contractor Sign In'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const SignInDialog(userType: 'contractor'),
                    );
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  child: const Text('Create Account'),
                  onPressed: () {
                    // Defaulting to contractor for demonstration purposes — you can make this user-selectable if needed
                    showDialog(
                      context: context,
                      builder: (context) => const CreateAccountDialog(userType: 'contractor'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
