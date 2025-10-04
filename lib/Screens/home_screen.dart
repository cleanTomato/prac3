import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_list_screen.dart';
import 'add_task_screen.dart';
import 'stats_screen.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Task> _tasks = [
  ];

  void _addTask(String title, String description) {
    setState(() {
      _tasks.add(Task(title: title, description: description));
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _resetAllTasks() {
    setState(() {
      _tasks.clear();

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      TaskListScreen(tasks: _tasks, onToggle: _toggleTask, onDelete: _deleteTask),
      AddTaskScreen(onAddTask: _addTask),
      StatsScreen(tasks: _tasks),
      SettingsScreen(onResetTasks: _resetAllTasks), // Передаем функцию сброса
      ProfileScreen(tasks: _tasks),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Менеджер задач'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Задачи'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Добавить'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Статистика'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}