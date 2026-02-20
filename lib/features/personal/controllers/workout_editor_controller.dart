import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/workout.dart';

final workoutEditorProvider =
    StateNotifierProvider<WorkoutEditorController, List<Workout>>(
  (ref) => WorkoutEditorController(),
);

class WorkoutEditorController extends StateNotifier<List<Workout>> {
  WorkoutEditorController() : super(const <Workout>[]);

  void addWorkout(Workout workout) {
    state = <Workout>[workout, ...state];
  }
}
