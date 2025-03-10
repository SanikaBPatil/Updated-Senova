import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ViewSchedulePage(),
  ));
}

class ViewSchedulePage extends StatefulWidget {
  @override
  _ViewSchedulePageState createState() => _ViewSchedulePageState();
}

class _ViewSchedulePageState extends State<ViewSchedulePage> {
  DateTime _selectedDay = DateTime.now();
  Map<DateTime, List<Map<String, String>>> _appointments = {};

  // Function to check if the appointment is for the selected day
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  // Function to add an appointment to the selected day
  void _addAppointment(String patientName, String time, String duration) {
    if (!_appointments.containsKey(_selectedDay)) {
      _appointments[_selectedDay] = [];
    }

    // Add the new appointment
    _appointments[_selectedDay]!.add({
      'patientName': patientName,
      'time': time,
      'duration': duration,
    });

    // Debugging: Print added appointment details
    print("Added appointment: $patientName at $time for $duration");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('View Schedule'),
      ),
      body: Column(
        children: [
          // Calendar
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            selectedDayPredicate: (day) => _isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),

          // Display appointments for the selected day
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _appointments[_selectedDay] == null ||
                  _appointments[_selectedDay]!.isEmpty
                  ? Center(
                child: Text(
                  "No appointments for this day.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: _appointments[_selectedDay]!.length,
                itemBuilder: (context, index) {
                  final appointment = _appointments[_selectedDay]![index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        appointment['patientName']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "Time: ${appointment['time']}, Duration: ${appointment['duration']}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _appointments[_selectedDay]!
                                .removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button for adding appointments
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          // Show dialog to add an appointment
          showDialog(
            context: context,
            builder: (context) {
              String patientName = '';
              String time = '';
              String duration = '';

              return AlertDialog(
                title: Text("Add Appointment"),
                content: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Patient Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      onChanged: (value) {
                        patientName = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Time (e.g., 2:00 PM)",
                        prefixIcon: Icon(Icons.access_time),
                      ),
                      onChanged: (value) {
                        time = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Duration (e.g., 30 mins)",
                        prefixIcon: Icon(Icons.timer),
                      ),
                      onChanged: (value) {
                        duration = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog without saving
                    },
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Only save if fields are not empty
                      if (patientName.isNotEmpty &&
                          time.isNotEmpty &&
                          duration.isNotEmpty) {
                        _addAppointment(patientName, time, duration);
                        Navigator.pop(context); // Close the dialog after saving
                      } else {
                        // Show error message if fields are empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill in all fields."),
                          ),
                        );
                      }
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
