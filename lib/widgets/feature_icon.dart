import 'package:flutter/material.dart';

class FeatureIcon extends StatelessWidget {
  const FeatureIcon({
    super.key,
    required this.icon,
    required this.subtitle,
    required this.title,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
          ),
          Text(title),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
