import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // For file picking functionality

class MedicationPage extends StatefulWidget {
  final String patientName;

  MedicationPage({required this.patientName});

  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  bool _showReportRecommendation = false;

  // List to store the medications added
  List<Map<String, String>> medications = [
    {'name': 'Medication 1', 'dosage': '10mg', 'time': '08:00 AM'},
    {'name': 'Medication 2', 'dosage': '5mg', 'time': '06:00 PM'},
  ];

  // Controllers for adding medication
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  // Controllers for editing reports and recommendations
  TextEditingController _reportController = TextEditingController();
  TextEditingController _recommendationController = TextEditingController();

  // List of uploaded report files
  List<String> uploadedReports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication History - ${widget.patientName}'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Health Data Box
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basic Health Data:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        healthDataItem('Heart Rate', '72 bpm'),
                        healthDataItem('Body Temp', '98.6°F'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        healthDataItem('Blood Glucose', '95 mg/dL'),
                        healthDataItem('Oxygen Saturation', '98%'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        healthDataItem('BMI', '22.5'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Medication Table
              Text(
                'Medication Prescribed for ${widget.patientName}:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue),
                ),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Dosage')),
                    DataColumn(label: Text('Time')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: medications
                      .map(
                          (medication) => DataRow(cells: [
                        DataCell(Text(medication['name']!)),
                        DataCell(Text(medication['dosage']!)),
                        DataCell(Text(medication['time']!)),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                medications.remove(medication);
                              });
                            },
                          ),
                        ),
                      ]))
                      .toList(),
                ),
              ),
              SizedBox(height: 20),

              // Add Medication Button
              ElevatedButton(
                onPressed: _showAddMedicationDialog,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Add Medication'),
              ),
              SizedBox(height: 20),

              // Report Section
              Text(
                'Reports:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Uploaded Reports:'),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: uploadedReports
                          .map(
                            (report) => Text(
                          report,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                          .toList(),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _uploadReport,
                      child: Text('Upload Report'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Recommendation Section
              Text(
                'Recommendation:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[50],
                  border: Border.all(color: Colors.blue),
                ),
                child: TextField(
                  controller: _recommendationController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Type your recommendation here...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Save Recommendation Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Logic to save recommendation goes here
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Save Recommendation'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to display health data items in a box
  Widget healthDataItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Icon(Icons.fitness_center, color: Colors.blue),
        Text(value),
      ],
    );
  }

  // Show dialog to add medication
  void _showAddMedicationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Medication Name'),
              ),
              TextField(
                controller: _dosageController,
                decoration: InputDecoration(labelText: 'Dosage'),
              ),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Add medication to the list
                setState(() {
                  medications.add({
                    'name': _nameController.text,
                    'dosage': _dosageController.text,
                    'time': _timeController.text,
                  });
                });
                _nameController.clear();
                _dosageController.clear();
                _timeController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to upload a report
  void _uploadReport() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        uploadedReports.add(result.files.single.name); // Add the file name to the list
      });
    }
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MedicationPage(patientName: 'John Doe'),
  ));
}
