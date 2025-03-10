import 'package:flutter/material.dart';


void main() {
  runApp(SeniorFitnessApp());
}

class SeniorFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SeniorFitnessPage(),
    );
  }
}

class SeniorFitnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA), // Light background
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A8DFF), Color(0xFF58DBCA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Senior Fitness & Diet Plan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Safe and effective exercises + Healthy meals',
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
                        Icons.fitness_center,
                        color: Color(0xFF58DBCA),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Today's Exercises Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Today's Exercises",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Exercise Cards
            ExerciseCard(
              title: 'Walking',
              subtitle: '15 minutes • Low impact',
              icon: Icons.directions_walk,
              iconColor: Colors.purple[200]!,
            ),
            ExerciseCard(
              title: 'Chair Yoga',
              subtitle: '10 minutes • Flexibility',
              icon: Icons.self_improvement,
              iconColor: Colors.teal[200]!,
            ),
            ExerciseCard(
              title: 'Balance Training',
              subtitle: '12 minutes • Stability',
              icon: Icons.accessibility_new,
              iconColor: Colors.orange[200]!,
            ),

            SizedBox(height: 20),

            // Progress Tracking Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Progress Tracking',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Weekly Goal Tracker
            ProgressTracker(
              label: 'Weekly Goal',
              progress: 4,
              maxProgress: 5,
              progressColor: Colors.purple,
            ),

            // Minutes Active Tracker
            ProgressTracker(
              label: 'Minutes Active',
              progress: 85,
              maxProgress: 120,
              progressColor: Colors.teal,
            ),

            SizedBox(height: 20),

            // Today's Meals Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Today's Meals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Meal Cards
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Nutritional Goals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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

            SizedBox(height: 20),

            // Health Reminders Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Health Reminders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            HealthTip(
              icon: Icons.local_drink,
              title: 'Stay Hydrated',
              description: 'Drink at least 8 glasses of water daily.',
            ),
            HealthTip(
              icon: Icons.bedtime,
              title: 'Get Enough Sleep',
              description: 'Aim for 7-8 hours of sleep every night.',
            ),
            HealthTip(
              icon: Icons.emoji_food_beverage,
              title: 'Eat Balanced Meals',
              description:
                  'Include proteins, carbs, and healthy fats in every meal.',
            ),

            SizedBox(height: 20),

            // Safety Tips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Safety Tips',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            HealthTip(
              icon: Icons.warning,
              title: 'Warm Up',
              description:
                  'Always start with warm-up exercises to avoid injuries.',
            ),
            HealthTip(
              icon: Icons.flash_on,
              title: 'Stay Energized',
              description:
                  'Carry a light snack to stay fueled during workouts.',
            ),
            HealthTip(
              icon: Icons.favorite,
              title: 'Listen to Your Body',
              description:
                  'Stop exercising if you feel any pain or discomfort.',
            ),

            SizedBox(height: 20),
          ],
        ),
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

// Exercise Card Widget
class ExerciseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;

  const ExerciseCard({
    required this.title,
    required this.subtitle,
    required this.icon,
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
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

// Health Tip Widget
class HealthTip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const HealthTip({
    required this.icon,
    required this.title,
    required this.description,
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
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: Icon(
            icon,
            color: Colors.blue,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
      ),
    );
  }
}

// Progress Tracker Widget
class ProgressTracker extends StatelessWidget {
  final String label;
  final int progress;
  final int maxProgress;
  final Color progressColor;

  const ProgressTracker({
    required this.label,
    required this.progress,
    required this.maxProgress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: progress / maxProgress,
                color: progressColor,
                backgroundColor: progressColor.withOpacity(0.2),
                minHeight: 8,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '$progress/$maxProgress',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }
}
