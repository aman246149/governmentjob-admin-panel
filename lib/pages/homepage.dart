import 'package:flutter/material.dart';

import '../widgets/right_side_tabs_pandel.dart';
import '../widgets/tab_bar_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Job Admin Panel"),),
      body: Row(
        children: const [
          Expanded(child: TabBarPanel()),
          Expanded(flex: 5,child:RightSideTabPanel()),
        ],
      )
    );
  }
}


