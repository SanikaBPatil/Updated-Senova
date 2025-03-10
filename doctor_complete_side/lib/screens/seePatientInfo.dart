import 'package:flutter/material.dart';
import 'appointment_page.dart'; // Import the new file for appointments

void main() {
  runApp(const PatientProfileApp());
}

class PatientProfileApp extends StatelessWidget {
  const PatientProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Details',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const PatientDetailsPage(),
    );
  }
}

class PatientDetailsPage extends StatelessWidget {
  const PatientDetailsPage({Key? key}) : super(key: key);

  void _callNumber(String number) {
    print('Calling $number...');
    // Add actual calling functionality here using the `url_launcher` package.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
        backgroundColor: const Color(0xFF49B2CC), // A calming teal-blue.
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Section: Patient Info and Profile Image
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF7F8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'John Doe', // Replace with real patient name
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF026AA7),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('DOB: 01/01/1980', style: TextStyle(fontSize: 16)),
                          Text('Gender: Male', style: TextStyle(fontSize: 16)),
                          Text('Age: 43', style: TextStyle(fontSize: 16)),
                          Text('Weight: 70 kg', style: TextStyle(fontSize: 16)),
                          Text('Blood Type: O+', style: TextStyle(fontSize: 16)),
                          Text('Blood Pressure: 120/80', style: TextStyle(fontSize: 16)),
                          Text('Heart Rate: 75 bpm', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage(
                            'assets/images/patient2.jpg', // Replace with your saved image path
                          ),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Contact Information Block
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF026AA7),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF7F8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildContactRow('Patient', '1234567890'),
                    _buildContactRow('1. Children / Caregiver', '9876543210'),
                    _buildContactRow('2. Children / Caregiver', '1231231234'),
                    _buildContactRow('3. Children / Caregiver', '4564564567'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Address Section
              const Text(
                'Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF026AA7),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF7F8),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Text(
                  '123, Street Name, City, Country', // Replace with actual address
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // View Appointment Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to AppointmentPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppointmentPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF49B2CC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text(
                  'View Appointments',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(String label, String number) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            onPressed: () => _callNumber(number),
            icon: const Icon(Icons.call, color: Colors.green, size: 28),
          ),
        ],
      ),
    );
  }
}
