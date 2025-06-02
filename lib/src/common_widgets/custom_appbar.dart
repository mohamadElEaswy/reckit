import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = 60});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;

    if (isDesktop) {
      return Container(
        height: height,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Logo
            const Text(
              'logo',
              style: TextStyle(color: Colors.orange, fontSize: 24),
            ),
            const Spacer(),
            // Navigation items
            const Text('Items', style: TextStyle(color: Colors.white)),
            const SizedBox(width: 16),
            const Text('Pricing', style: TextStyle(color: Colors.white)),
            // ...more items
            const Spacer(),
            // Icons and profile
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
          ],
        ),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.black,
        title: const Text('logo', style: TextStyle(color: Colors.orange)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
          ),
        ],
      );
    }
  }
}
