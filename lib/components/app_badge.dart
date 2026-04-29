import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final String title;
  final int? count;
  final Color? backgroundColor, textColor;
  const AppBadge({
    super.key,
    required this.title,
    this.count,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: const BorderSide(color: Colors.black12, width: 2),
        ),
        color: backgroundColor ?? Colors.black12,
      ),
      child: Center(
        child: Text(
          title + (count != null ? ' $count' : ''),
          style: TextStyle(color: textColor ?? Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
