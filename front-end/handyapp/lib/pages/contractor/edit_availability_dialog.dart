import 'package:flutter/material.dart';

class EditAvailabilityDialog extends StatefulWidget {
  const EditAvailabilityDialog({super.key});

  @override
  State<EditAvailabilityDialog> createState() => _EditAvailabilityDialogState();
}

class _EditAvailabilityDialogState extends State<EditAvailabilityDialog> {
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  String _formatTime(TimeOfDay? time) {
    if (time == null) return 'Not set';
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  Future<void> _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart
          ? _startTime ?? TimeOfDay.now()
          : _endTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  bool _validateTimes() {
    if (_startTime == null || _endTime == null) return false;
    final start = Duration(hours: _startTime!.hour, minutes: _startTime!.minute);
    final end = Duration(hours: _endTime!.hour, minutes: _endTime!.minute);
    return end > start;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Availability'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Text('Start Time:'),
              const SizedBox(width: 10),
              Text(_formatTime(_startTime)),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickTime(isStart: true),
                child: const Text('Set'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('End Time:'),
              const SizedBox(width: 10),
              Text(_formatTime(_endTime)),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickTime(isStart: false),
                child: const Text('Set'),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_validateTimes()) {
              // Normally this would send availability to backend
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Availability updated: ${_formatTime(_startTime)} - ${_formatTime(_endTime)} (mocked)',
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select valid start and end times.'),
                ),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
