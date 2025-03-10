import 'package:flutter/material.dart';

class PatientRequestPage extends StatefulWidget {
  const PatientRequestPage({Key? key}) : super(key: key);

  @override
  _PatientRequestPageState createState() => _PatientRequestPageState();
}

class _PatientRequestPageState extends State<PatientRequestPage> {
  List<Map<String, String>> patientRequests = [
    {'name': 'New Patient 1', 'profile': 'assets/profile10.png'},
    {'name': 'New Patient 2', 'profile': 'assets/profile11.png'},
    {'name': 'New Patient 3', 'profile': 'assets/profile12.png'},
    {'name': 'New Patient 4', 'profile': 'assets/profile13.png'},
  ];

  void acceptRequest(int index) {
    setState(() {
      patientRequests.removeAt(index); // Remove from the list on acceptance
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Accepted ${patientRequests[index]['name']}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void rejectRequest(int index) {
    setState(() {
      patientRequests.removeAt(index); // Remove from the list on rejection
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Rejected ${patientRequests[index]['name']}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Requests'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: patientRequests.isEmpty
            ? const Center(
          child: Text(
            'No new requests!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
            : ListView.builder(
          itemCount: patientRequests.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage:
                  AssetImage(patientRequests[index]['profile']!),
                  backgroundColor: Colors.grey[300],
                ),
                title: Text(
                  patientRequests[index]['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: const Text(
                  'Wants to connect with you',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check_circle,
                          color: Colors.green),
                      iconSize: 30,
                      onPressed: () => acceptRequest(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      iconSize: 30,
                      onPressed: () => rejectRequest(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
