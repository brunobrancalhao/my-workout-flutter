import 'package:flutter/widgets.dart';

import '../models/exercise.dart';

class ExerciseProvider with ChangeNotifier {
  List<Exercise> _list = [];

  Future<void> get(String workoutId) async {
    List<Exercise> filtered = [];
    _list.forEach((element) {
      if (element.workoutId == workoutId) {
        filtered.add(element);
      }
    });

    return filtered;
  }

  Future<void> add(Exercise e) {
    _list.add(e);
    notifyListeners();
  }

  Future<void> delete(String id) {
    _list.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
