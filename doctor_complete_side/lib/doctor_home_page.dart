import 'package:flutter/material.dart';
import 'screens/patient_list.dart'; // Import your pages here
import 'patient_request_page.dart';
import 'edit_doctor_profile.dart';
import 'view_schedule.dart';

void main() {
  runApp(const DoctorHomePage());
}

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  int _currentIndex = 0;

  // Dummy data for appointments
  final List<Map<String, String>> appointments = [
    {'patientName': 'John Doe', 'time': '10:00 AM', 'type': 'Consultation'},
    {'patientName': 'Jane Smith', 'time': '11:30 AM', 'type': 'Follow-up'},
    {'patientName': 'Michael Lee', 'time': '01:00 PM', 'type': 'Check-up'},
    {'patientName': 'Emily Brown', 'time': '02:45 PM', 'type': 'Therapy'},
  ];

  @override
  Widget build(BuildContext context) {
    // List of pages for navigation
    final List<Widget> _pages = [
      // "Today's Schedule" is the first page
      _buildSchedulePage(),
      PatientListPage(),
      PatientRequestPage(),
      EditDoctorProfile(),
      ViewSchedulePage(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/doctor.jpg'),
              ),
              const SizedBox(width: 10),
              const Text(
                "Dr. John Smith",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        body: _pages[_currentIndex], // Display the selected page
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex, // Highlight the selected icon
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home, size: 37),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/all_patients.png',
                height: 40,
              ),
              label: 'All Patients',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/pending_request.jpg',
                height: 40,
              ),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/doctor_profile_icon.jpg',
                height: 35,
              ),
              label: 'Edit Profile',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/appointments.png',
                height: 35,
              ),
              label: 'Schedule',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index to navigate
            });
          },
        ),
      ),
    );
  }

  // Build the "Today's Schedule" page
  Widget _buildSchedulePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Schedule",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        appointment['patientName']![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      appointment['patientName']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "${appointment['time']} - ${appointment['type']}"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to detailed appointment info
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
