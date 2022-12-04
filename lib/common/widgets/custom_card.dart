import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String avatar;
  final String name;
  final String time;
  final String diagnose;

  const CustomCard(
      {super.key,
      required this.avatar,
      required this.name,
      required this.time,
      required this.diagnose});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            avatar,
          ),
          radius: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$time - $diagnose',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
