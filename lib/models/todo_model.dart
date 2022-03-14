class TodoModel {
  String todoId;
  String todoTitle;

  TodoModel({required this.todoId, required this.todoTitle});

  factory TodoModel.fromFirestore(Map<String, dynamic> json) {
    return TodoModel(
      todoId: json["todoId"],
      todoTitle: json["todoTitle"],
    );
  }

  Map<String, dynamic> toFirestore() => {
        "todoId": todoId,
        "todoTitle": todoTitle,
      };
}
