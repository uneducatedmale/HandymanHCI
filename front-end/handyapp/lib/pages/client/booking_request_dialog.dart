import 'package:flutter/material.dart';

/*
  File: booking_request_dialog.dart
  Purpose:
  - Allows clients to send a mock booking request to a contractor.

  Functionality:
  - Collects date, time, and a short description of the job.
  - Validates fields and returns a mock success message.

  Design:
  - Consistent with the rest of the app using styled inputs and buttons.
*/

class BookingRequestDialog extends StatefulWidget {
  final String contractorName;

  const BookingRequestDialog({super.key, required this.contractorName});

  @override
  State<BookingRequestDialog> createState() => _BookingRequestDialogState();
}

class _BookingRequestDialogState extends State<BookingRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Request Booking with ${widget.contractorName}'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Preferred Date (e.g., 2025-05-01)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a date' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Preferred Time (e.g., 2:00 PM)'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a time' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Job Description'),
                maxLines: 3,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Describe the job' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('Submit Request'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Request sent to ${widget.contractorName} (mocked)')),
              );
            }
          },
        ),
      ],
    );
  }
}
