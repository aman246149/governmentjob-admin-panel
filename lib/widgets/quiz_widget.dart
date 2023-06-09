import 'package:flutter/material.dart';


class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 10,
      color: Colors.black,
    );
  }
}

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.text,
    required this.color,
  });
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: color),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black),
      )),
    );
  }
}
