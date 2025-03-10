import 'package:flutter/material.dart';
import 'appointment_page.dart'; // Import the AppointmentPage
import 'medication_page.dart'; // Import the MedicationPage
import 'reminderSet.dart'; // Import the ReminderSet Page
import 'seePatientInfo.dart'; // Import the SeePatientInfo Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PatientDetailPage(patientName: 'John Doe', profileImage: 'assets/profile.jpg'),
        '/home': (context) => HomePage(),
        '/seePatientInfo': (context) => PatientProfileApp(), // Updated route
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome Home')),
    );
  }
}

class PatientDetailPage extends StatelessWidget {
  final String patientName;
  final String profileImage;

  PatientDetailPage({required this.patientName, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to home page using route
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to SeePatientInfoPage
              Navigator.pushNamed(context, '/seePatientInfo');
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Make the entire body scrollable
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Patient name and profile image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Patient: $patientName',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Health data (blood pressure, etc.) with interactive sliders or buttons
              HealthDataCard(title: 'Blood Pressure', data: '120/80 mmHg', isEditable: true),
              HealthDataCard(title: 'Heart Rate', data: '72 bpm', isEditable: false),
              HealthDataCard(title: 'Oxygen Saturation', data: '98%', isEditable: false),
              SizedBox(height: 20),

              // Four graphs and fall detection section
              Column(
                children: [
                  GraphTile(title: 'Heart Rate Graph', graphType: 'HeartRate'),
                  GraphTile(title: 'Blood Oxygen Graph', graphType: 'BloodOxygen'),
                  GraphTile(title: 'Motion Detection Graph', graphType: 'MotionDetection'),
                  GraphTile(title: 'Sleep Cycle Graph', graphType: 'SleepCycle'),
                  SizedBox(height: 20),
                  FallDetectionOption(),
                ],
              ),
              SizedBox(height: 20),

              // Four icons at the bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconCircle(icon: Icons.notifications, label: 'Set Reminder', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReminderSetApp()),
                    );
                  }),
                  IconCircle(
                    icon: Icons.history,
                    label: 'Medical History',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MedicalHistoryPage()),
                      );
                    },
                  ),
                  IconCircle(
                    icon: Icons.medical_services,
                    label: 'Medication',
                    onTap: () {
                      // Navigate to MedicationPage and pass the patientName
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicationPage(patientName: patientName),
                        ),
                      );
                    },
                  ),
                  IconCircle(
                    icon: Icons.account_circle,  // Replaced Contacts with Profile Icon
                    label: 'Profile',
                    onTap: () {
                      // Navigate to SeePatientInfoPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PatientProfileApp()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HealthDataCard extends StatelessWidget {
  final String title;
  final String data;
  final bool isEditable;

  HealthDataCard({required this.title, required this.data, required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        subtitle: isEditable
            ? Column(
          children: [
            Text('Current: $data'),
            Slider(
              value: double.tryParse(data.split('/')[0]) ?? 0.0,
              min: 0,
              max: 200,
              onChanged: (value) {
                // Handle slider value change (for editable data)
              },
            ),
          ],
        )
            : Text('Current: $data'),
        trailing: Icon(Icons.edit),
        onTap: () {
          // Handle click for editable health data
        },
      ),
    );
  }
}

class GraphTile extends StatelessWidget {
  final String title;
  final String graphType;

  GraphTile({required this.title, required this.graphType});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.bar_chart),
        onTap: () {
          // Handle graph click
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Graph for $graphType'),
                content: Text('Here will be a graph for $graphType.'), // Placeholder
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'),
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

class FallDetectionOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Fall Detection'),
        trailing: Icon(Icons.warning),
        onTap: () {
          // Handle fall detection option click
        },
      ),
    );
  }
}

class IconCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;

  IconCircle({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class MedicalHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical History'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to appointments
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentPage()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text('View Appointments'),
        ),
      ),
    );
  }
}

class SeePatientInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Info'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show detailed patient info (name, age, medical history, etc.)
            Text('Patient Name: John Doe'),
            Text('Date of Birth: 01/01/1990'),
            Text('Gender: Male'),
            Text('Medical History: Hypertension, Asthma'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Patient Details'),
            ),
          ],
        ),
      ),
    );
  }
}
