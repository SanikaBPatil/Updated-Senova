import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List<Map<String, String>> oldAppointments = [
    {'aptNumber': 'A001', 'aptDate': '2024-10-15', 'aptTime': '10:00 AM'},
    {'aptNumber': 'A002', 'aptDate': '2024-10-18', 'aptTime': '02:00 PM'},
  ];

  List<Map<String, String>> upcomingAppointments = [];

  TextEditingController aptDateController = TextEditingController();
  TextEditingController aptTimeController = TextEditingController();

  void setNewAppointment() {
    if (aptDateController.text.isNotEmpty && aptTimeController.text.isNotEmpty) {
      final newAppointment = {
        'aptNumber': 'A${oldAppointments.length + upcomingAppointments.length + 1}',
        'aptDate': aptDateController.text,
        'aptTime': aptTimeController.text,
      };

      setState(() {
        upcomingAppointments.add(newAppointment);
      });

      aptDateController.clear();
      aptTimeController.clear();
    }
  }

  void deleteOldAppointment(int index) {
    setState(() {
      oldAppointments.removeAt(index);
    });
  }

  void deleteUpcomingAppointment(int index) {
    setState(() {
      upcomingAppointments.removeAt(index);
    });
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        aptDateController.text = "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        final hours = pickedTime.hourOfPeriod.toString().padLeft(2, '0');
        final minutes = pickedTime.minute.toString().padLeft(2, '0');
        final period = pickedTime.period == DayPeriod.am ? 'AM' : 'PM';
        aptTimeController.text = "$hours:$minutes $period";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment History'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Old Appointments:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              oldAppointments.isEmpty
                  ? Text('No old appointments available')
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: oldAppointments.length,
                itemBuilder: (context, index) {
                  final apt = oldAppointments[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    elevation: 4,
                    child: ListTile(
                      title: Text('Appointment #${apt['aptNumber']}'),
                      subtitle: Text('${apt['aptDate']} - ${apt['aptTime']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteOldAppointment(index),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                'Set New Appointment:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: aptDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Appointment Date',
                  hintText: 'Select appointment date',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => pickDate(context), // Opens date picker
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: aptTimeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Appointment Time',
                  hintText: 'Select appointment time',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => pickTime(context), // Opens time picker
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: setNewAppointment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Set Appointment'),
              ),
              SizedBox(height: 20),
              Text(
                'Upcoming Appointments:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              upcomingAppointments.isEmpty
                  ? Text('No upcoming appointments set.')
                  : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: upcomingAppointments.length,
                itemBuilder: (context, index) {
                  final apt = upcomingAppointments[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    elevation: 4,
                    child: ListTile(
                      title: Text('Appointment #${apt['aptNumber']}'),
                      subtitle: Text('${apt['aptDate']} - ${apt['aptTime']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteUpcomingAppointment(index),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
