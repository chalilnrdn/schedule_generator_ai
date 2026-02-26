import 'package:flutter/material.dart';
import 'package:schedule_generator_ai/models/task.dart';

class AddTaskCard extends StatefulWidget {
  final Function(Task) onAddTask;
  const AddTaskCard({super.key, required this.onAddTask});

  @override
  State<AddTaskCard> createState() => _AddTaskCardState();
}

class _AddTaskCardState extends State<AddTaskCard> {
  final taskController = TextEditingController();
  final durationController = TextEditingController();
  final deadlineController = TextEditingController();
  String? priority;

  @override
  void dispose() {
    taskController.dispose();
    durationController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  void _submit() {
    if (taskController.text.isNotEmpty && durationController.text.isNotEmpty && deadlineController.text.isNotEmpty && priority != null) {
      widget.onAddTask(Task(
        name: taskController.text,
        priority: priority!,
        duration: int.tryParse(durationController.text) ?? 5,
        deadline: deadlineController.text
      ));

      taskController.clear();
      durationController.clear();
      deadlineController.clear();
      setState(() => priority = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
               children: [
                Icon(
                  Icons.playlist_add_check_circle_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 8),

                Text(
                  "Add Task",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                )
               ],
            )
          ],
        ),
      ),
    );
  }
}