import 'package:bullshit/models/todo_model.dart';
import 'package:bullshit/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowTodoScreen extends StatelessWidget {
  const ShowTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: getScreenWidth(context),
        height: getScreenHeight(context) * 0.9,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("todos").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (snapshots.hasError) {
                return const Text("Error");
              }

              switch (snapshots.connectionState) {
                case ConnectionState.none:
                  return const Text("No Internet");

                case ConnectionState.waiting:
                  return const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(),
                  );

                case ConnectionState.active:
                  final todos = snapshots.data!.docs
                      .map((e) => TodoModel.fromFirestore(
                          e.data() as Map<String, dynamic>))
                      .toList();
                  return ListView.builder(
                    itemCount: todos.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ListTile(
                            leading: SizedBox(
                                width: getScreenWidth(context) * 0.5,
                                child: Text(todos[index].todoTitle)),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    )),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                case ConnectionState.done:
                  return const SizedBox();
              }
            }),
      ),
    );
  }
}
