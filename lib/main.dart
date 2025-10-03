import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Практическая работа 3 - Основные виджеты'),
    );
  }
}

// Собственный StatelessWidget - Информационная карточка
class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const InfoCard({
    super.key,
    required this.title,
    required this.description,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Использование собственного StatelessWidget - InfoCard
            const Text(
              'Собственный StatelessWidget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const InfoCard(
              title: 'Добро пожаловать!',
              description: 'Это пример использования собственного StatelessWidget. Карточка может переиспользоваться с разным содержимым.',
              color: Colors.green,
            ),

            const InfoCard(
              title: 'Статистика',
              description: 'Количество нажатий кнопки отображается ниже. Этот виджет демонстрирует принцип переиспользования кода.',
              color: Colors.orange,
            ),

            // 1. Text Widget
            const Text(
              '1. Виджет Text',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Это пример использования виджета Text для отображения текстовой информации.',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),

            // 2. Button Widget
            const Text(
              '2. Виджет Button',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Нажми меня!'),
            ),
            const SizedBox(height: 10),
            Text(
              'Счетчик: $_counter',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),

            // 3. Column Widget
            const Text(
              '3. Виджет Column',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  color: Colors.red,
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text('Элемент 1')),
                ),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text('Элемент 2')),
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: double.infinity,
                  child: const Center(child: Text('Элемент 3')),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 4. Row Widget
            const Text(
              '4. Виджет Row',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.orange,
                  height: 60,
                  width: 60,
                  child: const Center(child: Text('1')),
                ),
                Container(
                  color: Colors.purple,
                  height: 60,
                  width: 60,
                  child: const Center(child: Text('2')),
                ),
                Container(
                  color: Colors.teal,
                  height: 60,
                  width: 60,
                  child: const Center(child: Text('3')),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 5. SizedBox Widget
            const Text(
              '5. Виджет SizedBox',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 20), // Пространство между элементами
                Container(
                  color: Colors.green,
                  height: 40,
                  width: 40,
                ),
                const SizedBox(width: 20),
                Container(
                  color: Colors.blue,
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 6. Padding Widget
            const Text(
              '6. Виджет Padding',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.amber,
                height: 60,
                width: double.infinity,
                child: const Center(child: Text('Этот контейнер имеет отступы')),
              ),
            ),
            const SizedBox(height: 20),

            // 7. Container Widget
            const Text(
              '7. Виджет Container',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Это виджет Container с разными свойствами',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}