import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String, String) onAddTask;

  const AddTaskScreen({super.key, required this.onAddTask});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _addTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isNotEmpty) {
      widget.onAddTask(title, description);
      _titleController.clear();
      _descriptionController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Задача добавлена!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Новая задача', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Название задачи',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.title),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Описание',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.description),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _addTask,
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text('Добавить задачу'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}