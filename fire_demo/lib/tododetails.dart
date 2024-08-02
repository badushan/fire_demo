import 'package:flutter/material.dart';

class Tododetails extends StatelessWidget {
  const Tododetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.amber),
            ),
            Text(
              'Complete it as soon as possible',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.amber),
            ),
            const Divider(),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return const ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.black),
                      title: Text('username'),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: 40),
            )
          ],
        ),
      ),
    );
  }
}
