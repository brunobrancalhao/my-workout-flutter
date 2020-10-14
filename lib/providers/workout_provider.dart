import 'dart:math';

import 'package:flutter/material.dart';

import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  Future<List<Workout>> get() async {
    return await Future.delayed(Duration(seconds: 3), () => [..._workouts]);
  }

  Future<void> add(Workout w) async {
    w.id = Random().nextInt(100).toString();
    _workouts.add(w);
    notifyListeners();
  }

  Future<void> update(Workout w) async {
    _workouts = _workouts.map((e) {
      if (e.id == w.id) {
        e.imageUrl = w.imageUrl;
        e.name = w.name;
        e.weekDay = w.weekDay;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  Future<void> delete(String id) async {
    _workouts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Workout getById(String id) {
    return _workouts.firstWhere((element) => element.id == id);
  }
}
