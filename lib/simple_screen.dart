import 'package:flutter/material.dart';
import 'package:task/task_model.dart';

class SimpleScreen extends StatefulWidget {
  const SimpleScreen({super.key});

  @override
  State<SimpleScreen> createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  final List<Task> _tasks = [
    Task(id: 1, title: "Task 1", description: "First task", isCompleted: false),
    Task(
      id: 2,
      title: "Task 2",
      description: "Second task",
      isCompleted: false,
    ),
    Task(id: 3, title: "Task 3", description: "Third task", isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "My Task",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];

          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF1F2937),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Row(
                children: [
                  Text(
                    task.description,
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    task.isCompleted ? "Completed" : "Not Completed",
                    style: TextStyle(
                      color: task.isCompleted ? Color(0xFF16A34A) : Color(0xFFD97706),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              trailing: Checkbox(
                value: task.isCompleted,
                onChanged: (value) {
                  setState(() {
                    task.isCompleted = value ?? false;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          );
        },
      ),
    );
  }
}
