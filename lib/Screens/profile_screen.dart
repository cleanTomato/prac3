import 'package:flutter/material.dart';
import '../models/task.dart';

class ProfileScreen extends StatelessWidget {
  final List<Task> tasks;

  const ProfileScreen({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final completedTasks = tasks.where((task) => task.isCompleted).length;
    final totalTasks = tasks.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple[100],
              border: Border.all(color: Colors.deepPurple, width: 3),
            ),
            child: const Icon(Icons.person, size: 60, color: Colors.deepPurple),
          ),
          const SizedBox(height: 24),
          const Text(
            'Андрей Моторин',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Группа: ИКБО-12-22',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat('Задачи', totalTasks.toString()),
              _buildProfileStat('Выполнено', completedTasks.toString()),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Редактировать профиль'),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Выйти'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}