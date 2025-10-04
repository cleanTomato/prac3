import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggle;
  final Function(int) onDelete;

  const TaskListScreen({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Мои задачи',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text('Нет задач', style: TextStyle(fontSize: 18, color: Colors.grey)))
                : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onToggle: () => onToggle(index),
                  onDelete: () => onDelete(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}