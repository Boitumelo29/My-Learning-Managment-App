import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text("title"),),
        bottomNavigationBar: const TabBar(
            tabs: [Icon(Icons.home), Icon(Icons.home), Icon(Icons.home)]),
        body: const TabBarView(
          children: [Icon(Icons.home), Icon(Icons.home), Icon(Icons.home)],
        ),
      ),
    );
  }
}
