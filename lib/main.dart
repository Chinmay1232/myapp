import 'package:flutter/material.dart';
import 'dart:math';

import 'package:myapp/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Today\'s Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // Modern font
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SignInView(),
    );
  }
}

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final List<Color> colors = [
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.pinkAccent,
    Colors.orangeAccent,
    Colors.cyanAccent,
    Colors.tealAccent
  ];

  final List<String> times = [
    "07:30 AM - 09:00 AM",
    "12:00 PM - 01:45 PM",
    "04:30 PM - 05:15 PM",
    "07:30 PM - 09:00 PM"
  ];

  int idx = 0;
  String title = "Today's Menu";

  @override
  void initState() {
    super.initState();
    idx = Random().nextInt(colors.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        backgroundColor: colors[idx],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TomorrowScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colors[idx].withOpacity(0.5), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              "Hello!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colors[idx],
              ),
            ),
            const SizedBox(height: 20),
            buildMenuItem("Breakfast", "Items: Eggs, Bread, Juice", times[0],
                Icons.free_breakfast),
            buildMenuItem("Lunch", "Items: Rice, Curry, Salad", times[1],
                Icons.lunch_dining),
            buildMenuItem("Snacks (Boys)", "Items: Biscuits, Tea", times[2],
                Icons.cookie),
            buildMenuItem("Snacks (Girls)", "Items: Pastries, Coffee", times[2],
                Icons.coffee),
            buildMenuItem(
                "Dinner", "Items: Pasta, Salad", times[3], Icons.dinner_dining),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            idx = (idx + 1) % colors.length; // Cycle through the colors
          });
        },
        backgroundColor: colors[idx],
        elevation: 8,
        child: const Icon(Icons.palette, size: 28),
      ),
    );
  }

  Widget buildMenuItem(
      String heading, String items, String time, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          idx = (idx + 1) % colors.length; // Cycle through the colors
        });
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: colors[idx], size: 28),
                  const SizedBox(width: 10),
                  Text(
                    heading,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                items,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TomorrowScreen extends StatelessWidget {
  const TomorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tomorrow's Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Tomorrow's menu will be displayed here",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
