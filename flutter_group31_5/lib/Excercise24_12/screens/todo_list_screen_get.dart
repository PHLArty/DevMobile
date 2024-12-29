import 'package:flutter/material.dart';
import 'package:flutter_group31_5/Excercise24_12/database/database_helper.dart';
import 'package:flutter_group31_5/Excercise24_12/models/todo.dart';
import 'package:get/get.dart';

class todoListGetController extends GetxController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController textController = TextEditingController();
  final RxList<Todo> todos = <Todo>[].obs;

  // Load all todos from the database
  Future<void> loadTodos() async {
    final fetchedTodos = await _databaseHelper.getTodos();
    todos.assignAll(fetchedTodos); // Notify listeners
  }

  // Add a new todo
  Future<void> addTodo() async {
    if (textController.text.isEmpty) return;

    final todo = Todo(title: textController.text);
    await _databaseHelper.insertTodo(todo);
    textController.clear();
    loadTodos(); // Reload todos after adding
  }

  // Toggle a todo's completion status
  Future<void> toggleTodo(Todo todo) async {
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      isCompleted: !todo.isCompleted,
    );
    await _databaseHelper.updateTodo(updatedTodo);
    loadTodos(); // Reload todos after updating
  }

  // Delete a todo
  Future<void> deleteTodo(int id) async {
    await _databaseHelper.deleteTodo(id);
    loadTodos(); // Reload todos after deleting
  }
}

class TodoListScreenGetController extends StatelessWidget {
  const TodoListScreenGetController({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListGetController controller = Get.put(todoListGetController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: controller.addTodo, // Updated function
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (context, index) {
                  final todo = controller.todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (bool? value) => controller.toggleTodo(todo),
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.deleteTodo(todo.id!),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
