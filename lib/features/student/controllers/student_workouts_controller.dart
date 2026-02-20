import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/workout.dart';

final studentWorkoutsProvider = Provider<List<Workout>>((ref) {
  return const <Workout>[
    Workout(
      id: 'w1',
      name: 'Treino A - Pernas',
      notes: 'Carga progressiva e cadência controlada.',
      videoUrl: 'https://www.youtube.com/watch?v=H1v8B3LxS2A',
      exercisesCount: 6,
    ),
    Workout(
      id: 'w2',
      name: 'Treino B - Peito e tríceps',
      notes: 'Descanso de 60s entre séries.',
      videoUrl: null,
      exercisesCount: 5,
    ),
  ];
});
