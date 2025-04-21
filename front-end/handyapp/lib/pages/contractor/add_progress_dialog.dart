import 'package:flutter/material.dart';

class AddProgressDialog extends StatefulWidget {
  const AddProgressDialog({super.key});

  @override
  State<AddProgressDialog> createState() => _AddProgressDialogState();
}

class _AddProgressDialogState extends State<AddProgressDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _statusController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log Project Progress'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _statusController,
                decoration: const InputDecoration(
                  labelText: 'Status Description',
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a status update' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'Image URL (optional)',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    child: const Text('Pick Date'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Normally, progress would be sent to backend here
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Progress update added (mocked)')),
              );
            }
          },
          child: const Text('Add Progress'),
        ),
      ],
    );
  }
}
