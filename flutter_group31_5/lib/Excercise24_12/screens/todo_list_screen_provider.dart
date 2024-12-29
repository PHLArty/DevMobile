import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../database/database_helper.dart';

class TodoListProvider extends ChangeNotifier {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final TextEditingController _controller = TextEditingController();
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;
  
  Future<void> _loadTodos() async {
    final todos = await _databaseHelper.getTodos();
    _todos = todos;
    notifyListeners();
  }

  Future<void> _addTodo() async {
    if (_controller.text.isEmpty) return;

    final todo = Todo(title: _controller.text);
    await _databaseHelper.insertTodo(todo);
    _controller.clear();
    _loadTodos();
  }

  Future<void> _toggleTodo(Todo todo) async {
    final updatedTodo = Todo(
      id: todo.id,
      title: todo.title,
      isCompleted: !todo.isCompleted,
    );
    await _databaseHelper.updateTodo(updatedTodo);
    _loadTodos();
  }

  Future<void> _deleteTodo(int id) async {
    await _databaseHelper.deleteTodo(id);
    _loadTodos();
  }
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoListProvider>(
      builder: (context, todoListProvider, child) {
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
                    controller: todoListProvider._controller,
                    decoration: const InputDecoration(
                      hintText: 'Add a new todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: todoListProvider._addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoListProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoListProvider.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) => todoListProvider._toggleTodo(todo),
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
                    onPressed: () => todoListProvider._deleteTodo(todo.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
      }
      );
  }
}