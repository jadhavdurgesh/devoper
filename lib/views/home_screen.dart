import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 10,
        centerTitle: true,
        leading: const Icon(CupertinoIcons.home),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)),
        ],
        title: const Text(
          'Devoper',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 24),
        child: FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.add_outlined, size: 32,),
        ),
      ),
    );
  }
}
