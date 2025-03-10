import 'package:flutter/material.dart';
import 'patient_detail.dart'; // Import the PatientDetailPage

class PatientListPage extends StatelessWidget {
  final List<Map<String, String>> patients = [
    {'name': 'Dhanashri Dhekale', 'profile': 'assets/images/profile1.jpg'},
    {'name': 'Janki sutar', 'profile': 'assets/images/profile2.png'},
    {'name': 'Alice Jagadale', 'profile': 'assets/images/profile3.png'},
    {'name': 'Baburav thomar', 'profile': 'assets/images/profile4.jpg'},
    {'name': 'Chris Evans', 'profile': 'assets/images/profile5.jpg'},
    {'name': 'Emma Watson', 'profile': 'assets/profile6.png'},
    {'name': 'Liam Brown', 'profile': 'assets/profile7.png'},
    {'name': 'Sophia Turner', 'profile': 'assets/profile8.png'},
    {'name': 'James King', 'profile': 'assets/profile9.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient List'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(patients[index]['profile']!),
              backgroundColor: Colors.grey[300],
            ),
            title: Text(patients[index]['name']!),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to PatientDetailPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailPage(
                    patientName: patients[index]['name']!,
                    profileImage: patients[index]['profile']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}