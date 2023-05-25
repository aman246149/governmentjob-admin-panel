import 'package:flutter/material.dart';
import 'package:governmentjobadmin/providers/layout_provider.dart';
import 'package:provider/provider.dart';

class TabBarPanel extends StatelessWidget {
  const TabBarPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final data=context.read<LayoutProvider>().tabs;
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.read<LayoutProvider>().setJumToPage(index);
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey)
            ),
            child: Center(child: Text(data[index],style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),))),
        );
    },);
  }
}