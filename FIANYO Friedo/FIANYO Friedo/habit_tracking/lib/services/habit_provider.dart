import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/habit.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> habits = [];

  HabitProvider() {
    _loadHabits();
  }

  void _loadHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? habitNames = prefs.getStringList('habits');

    if (habitNames != null) {
      habits = habitNames.map((name) {
        bool isCompleted = prefs.getBool(name) ?? false;
        return Habit(name, isCompleted);
      }).toList();

      notifyListeners();
    }
  }

  void addHabit(String habitName) async {
    habits.add(Habit(habitName, false));
    _saveHabits();
  }

  void toggleHabit(int index) {
    habits[index].isCompleted = !habits[index].isCompleted;
    _saveHabits();
  }

  void deleteHabit(int index) {
    habits.removeAt(index);
    _saveHabits();
  }

  void _saveHabits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('habits', habits.map((habit) => habit.name).toList());

    for (var habit in habits) {
      prefs.setBool(habit.name, habit.isCompleted);
    }

    notifyListeners();
  }
}
