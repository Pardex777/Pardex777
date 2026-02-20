class Workout {
  const Workout({
    required this.id,
    required this.name,
    required this.notes,
    required this.videoUrl,
    required this.exercisesCount,
  });

  final String id;
  final String name;
  final String notes;
  final String? videoUrl;
  final int exercisesCount;

  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'] as String,
      name: map['name'] as String,
      notes: map['notes'] as String? ?? '',
      videoUrl: map['video_url'] as String?,
      exercisesCount: map['exercises_count'] as int? ?? 0,
    );
  }
}
