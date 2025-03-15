import 'package:flutter/material.dart';
import 'upcoming_appointments.dart';
import 'health_history.dart';
import 'patient_diet.dart';
import 'patient_workout.dart';


void main() {
  runApp(PatientMainApp());
}

class PatientMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PatientMainPage(),
    );
  }
}

class PatientMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Dashboard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          // Profile Picture and Welcome Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image1.png'), // Ensure assets/image1.png exists
                ),
                SizedBox(width: 16),
                Text(
                  'Welcome, Dhanashri!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Middle Section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Health Overview Section
                    _buildSectionTitle('Health Overview'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildHealthCard('Blood Pressure', '120/80', Icons.favorite, Colors.red),
                        _buildHealthCard('Heart Rate', '72 bpm', Icons.favorite_rounded, Colors.purple),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Daily Health Tips
                    _buildSectionTitle('Daily Health Tip'),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.lightbulb, color: Colors.orange, size: 40),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Drink 8 glasses of water today to stay hydrated!',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Medication Reminder Section
                    _buildSectionTitle('Medication Reminder'),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.medication, color: Colors.blue, size: 40),
                        title: Text('Take 1 tablet of Aspirin'),
                        subtitle: Text('Time: 9:00 AM'),
                        trailing: Icon(Icons.alarm, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Emergency Contact Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add emergency call functionality
                      },
                      icon: Icon(Icons.call, size: 24),
                      label: Text('Emergency Contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Navigation Row
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomIcon(
                  icon: Icons.calendar_today,
                  label: 'Appointments',
                  color: Colors.teal,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppointmentsPage()),
                    );
                  },
                ),
                _buildBottomIcon(
                  icon: Icons.history,
                  label: 'Health History',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HealthHistoryPage()),
                    );
                  },
                ),
                _buildBottomIcon(
                  icon: Icons.restaurant_menu,
                  label: 'Diet',
                  color: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DietPlanApp()),
                    );
                  },
                ),
                _buildBottomIcon(
                  icon: Icons.fitness_center,
                  label: 'Workout',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeniorFitnessApp()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthCard(String title, String value, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildBottomIcon({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30, color: color),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

