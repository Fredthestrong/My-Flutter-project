import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/habit_provider.dart';
import 'screens/habit_tracker_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HabitProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit Tracking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HabitTrackerScreen(),
      ),
    );
  }
}
