class Todo {
  // Variables
  String title;
  String description;
  bool status;
  int periority;

  // Constractors
  Todo(
      {required this.title,
      required this.description,
      required this.status,
      required this.periority});

  // Methods
  @override
  String toString() {
    return 'Title: $title , Description: $description , is Done: $status , priority: $periority';
  }
}
