import 'package:bullshit/models/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Network {
  final firestore = FirebaseFirestore.instance;

  Future<void> addTodoToFirestore({required TodoModel todo}) async {
    try {
      await firestore
          .collection("todos")
          .add(todo.toFirestore())
          .then((value) async {
        await firestore.collection("todos").doc(value.id).update({
          "todoId": value.id,
        });
      });
    } catch (e) {
      throw e;
    }
  }
}
