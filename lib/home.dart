import 'package:flutter/material.dart';
import 'package:localization_bloc/app_localization.dart';
import 'package:localization_bloc/navigation.dart';
import 'package:localization_bloc/settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text(context.tr('home')),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                context.push(const Settings());
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              context.tr('hello_msg'),
              style: const TextStyle(fontSize: 30),
            ),
            const Text(
              'this text will not be translated.',
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
