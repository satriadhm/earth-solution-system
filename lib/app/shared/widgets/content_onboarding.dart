

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Content extends StatelessWidget{
  final List<String> imageList;
  final int currentPage;
  final String title;
  final String subtitle;
  final void Function() nextPage;
  final void Function() skipPage;

  const Content({
    super.key,
    required this.imageList,
    required this.currentPage,
    required this.title,
    required this.subtitle,
    required this.nextPage,
    required this.skipPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imageList.length,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: index == currentPage ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: skipPage,
              child: const Text('Skip'),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: nextPage,
              child: const Text('Next'),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}