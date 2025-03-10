import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'medicine.dart';
import 'medicine_reminder.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicineQuantityController = TextEditingController();
  String? selectedImage;
  List<Medicine> _reminders = [];

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectImage() {
    // For simplicity, select image from predefined list or use Image Picker
    setState(() {
      selectedImage = 'assets/images/tablet2.jpg'; // Example image
    });
  }

  void _addReminder() {
    Medicine medicine = Medicine(
      name: medicineNameController.text,
      image: selectedImage,
      quantity: int.parse(medicineQuantityController.text),
      date: selectedDate,
      time: selectedTime,
    );

    setState(() {
      _reminders.add(medicine);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder Added')),
    );

    medicineNameController.clear();
    medicineQuantityController.clear();
    selectedImage = null;
  }

  void _deleteReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reminder Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Medicine Reminder'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: medicineNameController,
                    decoration: const InputDecoration(
                      labelText: 'Medicine Name',
                      prefixIcon: Icon(Icons.medical_services),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: medicineQuantityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Medicine Quantity',
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: selectedImage != null
                        ? Image.asset(selectedImage!)
                        : const Icon(Icons.image, size: 40),
                    title: const Text('Select Medicine Image'),
                    trailing: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: _selectImage,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.blue),
              title: const Text('Set Reminder Date'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => _selectDate(context),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.access_time, color: Colors.blue),
              title: const Text('Set Reminder Time'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => _selectTime(context),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Selected Date: ${DateFormat.yMMMd().format(selectedDate)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Selected Time: ${selectedTime.format(context)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _addReminder,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Reminder'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _reminders.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      _reminders[index].image ?? 'assets/images/default_image.jpg', // Default image if null
                    ),
                    title: Text('${_reminders[index].name} (${_reminders[index].quantity})'),
                    subtitle: Text(
                        'Date: ${DateFormat.yMMMd().format(_reminders[index].date)}, Time: ${_reminders[index].time.format(context)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteReminder(index);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicineReminder(_reminders[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
