import 'package:flutter/material.dart';
import 'medicine.dart';
import 'package:intl/intl.dart'; // Add this line

class MedicineReminder extends StatelessWidget {
  final Medicine medicine;

  const MedicineReminder(this.medicine, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminder: ${medicine.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            medicine.image != null
                ? Image.asset(medicine.image!)
                : const Icon(Icons.medical_services, size: 100),
            const SizedBox(height: 20),
            Text(
              'Medicine: ${medicine.name}',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              'Quantity: ${medicine.quantity}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: ${DateFormat.yMMMd().format(medicine.date)}', // Fixed DateFormat
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Time: ${medicine.time.format(context)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
