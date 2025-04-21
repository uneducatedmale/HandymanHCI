import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInDialog extends StatefulWidget {
  final String userType; // 'client' or 'contractor'

  const SignInDialog({super.key, required this.userType});

  @override
  State<SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<SignInDialog> {
  final RxString status = 'credentials'.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget credentialsWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'Sign In as ${widget.userType.capitalizeFirst}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
            obscureText: true,
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  status.value = 'signing-in';
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: const Text(
                        'Fill in all the credentials',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget signingInWidget() {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2), () => 'success'),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Signing In'),
                SizedBox(height: 30),
                CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          if (snapshot.data == 'success') {
            Future.delayed(const Duration(seconds: 1), () {
              final normalized = widget.userType.toLowerCase();
              Get.offNamed(normalized == 'client'
                  ? '/client_dashboard'
                  : '/contractor_dashboard');
            });
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Successfully signed in'),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data.toString()),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('Try Again'),
                        onPressed: () {
                          status.value = 'credentials';
                        },
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => status.value == 'credentials'
            ? credentialsWidget()
            : signingInWidget(),
      ),
    );
  }
}
