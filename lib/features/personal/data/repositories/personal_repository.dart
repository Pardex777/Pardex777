import '../../../../models/workout.dart';

abstract class PersonalRepository {
  Future<void> createWorkout(Workout workout);
  Future<List<Workout>> listWorkouts();
}
