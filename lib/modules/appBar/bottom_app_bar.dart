import 'package:flutter/material.dart';

class BottomAppBarContents extends StatelessWidget {
  const BottomAppBarContents({super.key});

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.route),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
