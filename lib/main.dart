import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planejador!',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Task {
  final String label;
  bool isDone;

  Task({required this.label, this.isDone = false});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> tasks = <Task>[];
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      tasks.add(Task(label: text));
      _controller.clear();
    });
  }

  double get progress {
    if (tasks.isEmpty) return 0.0;
    return tasks.where((t) => t.isDone).length / tasks.length;
  }

  void _showChecked() {
    final checkedTasks =
        tasks.where((t) => t.isDone).map((t) => '• ${t.label}').toList();
    final content = checkedTasks.isEmpty
        ? 'Nenhuma tarefa marcada.'
        : checkedTasks.join('\n');
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tarefas Marcadas'),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planejador!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Progress(value: progress),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Nova Tarefa',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: _addTask,
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TaskList(
                tasks: tasks,
                onToggle: (task, v) => setState(() => task.isDone = v ?? false),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showChecked,
        icon: const Icon(Icons.check),
        label: const Text('Ver marcadas'),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  final double value;
  const Progress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Progresso'),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: value.clamp(0.0, 1.0)),
          const SizedBox(height: 4),
          Text('${(value * 100).toStringAsFixed(0)}% concluído'),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final void Function(Task, bool?) onToggle;

  const TaskList({super.key, required this.tasks, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(child: Text('Nenhuma tarefa. Adicione uma!'));
    }
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final t = tasks[index];
        return TaskItem(
          label: t.label,
          value: t.isDone,
          onChanged: (v) => onToggle(t, v),
        );
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const TaskItem({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: value, onChanged: onChanged),
      title: Text(label),
      subtitle: value
          ? const Text('Concluído', style: TextStyle(color: Colors.green))
          : null,
      onTap: () => onChanged(!value),
    );
  }
}
