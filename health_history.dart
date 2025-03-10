import 'package:flutter/material.dart';

class HealthHistoryPage extends StatelessWidget {
  final List<Map<String, String>> healthRecords = [
    {
      'date': 'November 10, 2024',
      'details': 'Visited Dr. Smith for a regular check-up',
    },
    {
      'date': 'October 25, 2024',
      'details': 'Blood test for cholesterol levels',
    },
    {
      'date': 'September 15, 2024',
      'details': 'Physiotherapy session for back pain',
    },
    {
      'date': 'August 30, 2024',
      'details': 'MRI scan for knee injury',
    },
    {
      'date': 'July 20, 2024',
      'details': 'Vaccination for flu',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health History'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Past Health Records',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: healthRecords.length,
                itemBuilder: (context, index) {
                  final record = healthRecords[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        Icons.history,
                        size: 40,
                        color: Colors.teal,
                      ),
                      title: Text(
                        record['date']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(record['details']!),
                    ),
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
