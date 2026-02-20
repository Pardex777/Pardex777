import '../../../../models/workout.dart';

abstract class StudentRepository {
  Future<List<Workout>> listAssignedWorkouts(String studentId);
}
