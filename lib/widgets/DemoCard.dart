import 'package:flutter/material.dart';

class DemoCard extends StatelessWidget {
  final String title;
  final String description;
  final String routeName;
  final IconData icon;

  const DemoCard({
    super.key,
    required this.title,
    required this.description,
    required this.routeName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, routeName),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32.0, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 