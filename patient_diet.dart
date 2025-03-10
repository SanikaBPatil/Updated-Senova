import 'package:flutter/material.dart';

void main() {
  runApp(DietPlanApp());
}

class DietPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DietPlanPage(),
    );
  }
}

class DietPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A8DFF), Color(0xFF58DBCA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Diet Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Healthy eating for seniors',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.restaurant,
                      color: Color(0xFF58DBCA),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Main Scrollable Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                // Today's Meals Section
                Text(
                  "Today's Meals",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                MealCard(
                  icon: Icons.wb_sunny_outlined,
                  time: '8:00 AM',
                  mealName: 'Breakfast',
                  description: 'Oatmeal with berries & nuts',
                  iconColor: Colors.purple,
                ),
                MealCard(
                  icon: Icons.lunch_dining,
                  time: '12:30 PM',
                  mealName: 'Lunch',
                  description: 'Grilled chicken & vegetables',
                  iconColor: Colors.teal,
                ),
                MealCard(
                  icon: Icons.dinner_dining,
                  time: '6:00 PM',
                  mealName: 'Dinner',
                  description: 'Baked fish with quinoa',
                  iconColor: Colors.orange,
                ),
                SizedBox(height: 20),

                // Nutritional Goals Section
                Text(
                  'Nutritional Goals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                NutritionalGoalBar(
                  label: 'Protein',
                  value: 45,
                  maxValue: 60,
                  barColor: Colors.purple,
                ),
                NutritionalGoalBar(
                  label: 'Fiber',
                  value: 20,
                  maxValue: 25,
                  barColor: Colors.teal,
                ),
                NutritionalGoalBar(
                  label: 'Water',
                  value: 6,
                  maxValue: 8,
                  barColor: Colors.orange,
                ),
                SizedBox(height: 20),

                // Dietary Restrictions Section
                Text(
                  'Dietary Restrictions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    RestrictionChip(
                        label: 'Low Sodium', color: Colors.red[100]!),
                    RestrictionChip(
                        label: 'Diabetic Friendly', color: Colors.green[100]!),
                    RestrictionChip(
                        label: 'Low Cholesterol', color: Colors.yellow[100]!),
                  ],
                ),
                SizedBox(height: 20),

                // Recommendations Section
                Text(
                  'Recommendations',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Eat smaller portions more frequently throughout the day.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '• Choose foods rich in calcium and vitamin D.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '• Stay hydrated with water and clear fluids.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '• Limit processed foods and added sugars.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Meal Card Widget
class MealCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String mealName;
  final String description;
  final Color iconColor;

  const MealCard({
    required this.icon,
    required this.time,
    required this.mealName,
    required this.description,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          '$mealName - $time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}

// Nutritional Goal Bar Widget
class NutritionalGoalBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;
  final Color barColor;

  const NutritionalGoalBar({
    required this.label,
    required this.value,
    required this.maxValue,
    required this.barColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          '$label',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: value / maxValue,
                color: barColor,
                backgroundColor: barColor.withOpacity(0.2),
                minHeight: 8,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '$value/$maxValue',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}

// Dietary Restriction Chip Widget
class RestrictionChip extends StatelessWidget {
  final String label;
  final Color color;

  const RestrictionChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label, style: TextStyle(fontSize: 14)),
      backgroundColor: color,
    );
  }
}
