import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../components/primary_button.dart';
import '../../controllers/student_workouts_controller.dart';

class StudentHomePage extends ConsumerWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(studentWorkoutsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Seus treinos')),
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (BuildContext context, int index) {
          final workout = workouts[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    workout.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('${workout.exercisesCount} exercícios'),
                  const SizedBox(height: 10),
                  PrimaryButton(
                    label: 'Iniciar treino',
                    onPressed: () {},
                    icon: Icons.play_circle_fill,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
