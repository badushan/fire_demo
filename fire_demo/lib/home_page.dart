import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_demo/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _MyTODOviewState createState() => _MyTODOviewState();
}

class _MyTODOviewState extends State<HomePage> {
  final TodoController _todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _todoController.userStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final user = snapshot.data?.docs ?? [];
                  if (user.isEmpty) {
                    return const Center(child: Text('No todos available'));
                  }

                  return ListView.builder(
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      final todo = user[index];
                      final todoText = todo['name'] ?? 'No data';
                      final firstLetter =
                          todoText.isNotEmpty ? todoText[0] : '';

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            firstLetter,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(todoText),
                        trailing: const Icon(Icons.delete),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _todoController.titleTEC,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _todoController.addUser();
                    });
                  },
                  icon: const CircleAvatar(child: Icon(Icons.add)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
