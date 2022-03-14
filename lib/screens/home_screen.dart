import 'package:bullshit/models/todo_model.dart';
import 'package:bullshit/network/network.dart';
import 'package:bullshit/routes/routes.dart';
import 'package:bullshit/utils/dialogues.dart';
import 'package:bullshit/utils/helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> todoFormKey = GlobalKey();

  TextEditingController todoTitleCon = TextEditingController();
  TextEditingController exCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.showTodoScreen);
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Show Todo")),
              Form(
                key: todoFormKey,
                child: Column(
                  children: [
                    Text(
                      "Add a Todo",
                      style: getFormHeaderTextStyle(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.length < 6) {
                            return "Title must be at least 6 characters";
                          }
                          return null;
                        },
                        controller: todoTitleCon,
                        decoration: const InputDecoration(
                          label: Text("Todo Title"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (todoFormKey.currentState!.validate()) {
                    await uploadTodo(todoTitle: todoTitleCon.text);

                    todoTitleCon.clear();
                  }
                },
                child: const Text("Add Todo"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadTodo({required String todoTitle}) async {
    showLoadingDialogue(context);
    try {
      final network = Network();
      final todoToUpload = TodoModel(todoId: "", todoTitle: todoTitle);
      await network.addTodoToFirestore(todo: todoToUpload);
      Navigator.pop(context);
      showSuccessDialogue(context);
    } catch (e) {
      Navigator.pop(context);
      showDangerDialogue(context);
      throw e;
    }
  }
}
