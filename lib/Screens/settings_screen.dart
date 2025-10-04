import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback onResetTasks;

  const SettingsScreen({
    super.key,
    required this.onResetTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Настройки',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 24),

          // Кнопка сброса задач
          Container(
            width: double.infinity, // Растягиваем на всю ширину
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.delete_sweep, color: Colors.red),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Сброс задач',
                          style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                      Text('Удалить все задачи'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showResetConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Сбросить'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'О приложении',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                ),
                SizedBox(height: 8),
                Text(
                  'Менеджер задач v1.0\n\nПростое приложение для управления вашими задачами и повышения продуктивности.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showResetConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Сброс задач'),
          content: const Text('Вы уверены, что хотите удалить все задачи? Это действие нельзя отменить.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                onResetTasks();
                Navigator.of(context).pop();
                _showResetSuccessMessage(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('Удалить все'),
            ),
          ],
        );
      },
    );
  }

  void _showResetSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Все задачи удалены'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }
}