import 'package:get/get.dart';

class Todo {
  String title;
  String detail;
  bool isCompleted;

  Todo({
    required this.title,
    required this.detail,
    this.isCompleted = false,
  });
}

class TodoController extends GetxController {
  RxList<Todo> todos = <Todo>[].obs;
  RxList<Todo>? completedTodos;

  @override
  void onInit() {
    completedTodos = <Todo>[].obs; // Initialize completedTodos in onInit
    super.onInit();
  }

  void addTodo(String title, String detail) {
    todos.add(Todo(title: title, detail: detail));
  }

  void editTodo(int index, String newTitle, String newDetail) {
    todos[index].title = newTitle;
    todos[index].detail = newDetail;
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
  }

  void toggleCompleted(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    if (todos[index].isCompleted) {
      completedTodos?.add(todos[index]);
      if (todos.isNotEmpty) {
        todos.removeAt(index);
      }
    } else {
      completedTodos?.remove(todos[index]);
    }
  }
}
