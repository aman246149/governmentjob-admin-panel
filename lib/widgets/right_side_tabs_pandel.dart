import 'package:flutter/material.dart';
import 'package:governmentjobadmin/providers/layout_provider.dart';
import 'package:provider/provider.dart';

class RightSideTabPanel extends StatefulWidget {
  const RightSideTabPanel({super.key});

  @override
  State<RightSideTabPanel> createState() => _RightSideTabPanelState();
}

class _RightSideTabPanelState extends State<RightSideTabPanel> {
 
  @override
  Widget build(BuildContext context) {
    final data=context.read<LayoutProvider>();
    return PageView(
      controller: data.controller,
      children: data.pages,
    );
  }
}