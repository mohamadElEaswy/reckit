import 'package:flutter/material.dart';
import 'package:reckit/src/common_widgets/appbar_item.dart';
import 'package:reckit/src/constants/r.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({super.key, this.height = 76});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 600;

    if (isDesktop) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280, minWidth: 600),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border(bottom: BorderSide(color: R.colors.divider)),
          ),
          child: Row(
            children: [
              // Logo
              Image.asset('assets/icons/logo.png', height: 40, width: 82),
              const Spacer(),

              // Navigation items
              Row(
                children: [
                  ...[
                    AppbarItem(text: 'Items', isHighlighted: true),
                    const SizedBox(width: 32),
                    AppbarItem(text: 'Pricing', isHighlighted: false),
                    const SizedBox(width: 32),
                    AppbarItem(text: 'Info', isHighlighted: false),
                    const SizedBox(width: 32),
                    AppbarItem(text: 'Tasks', isHighlighted: false),
                    const SizedBox(width: 32),
                    AppbarItem(text: 'Analytics', isHighlighted: false),
                  ],
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: VerticalDivider(color: R.colors.divider),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/setting.png',
                      height: 22,
                      width: 22,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/pill.png',
                      height: 22,
                      width: 22,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: VerticalDivider(color: R.colors.divider),
                  ),
                  // Profile with dropdown
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=3',
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'John Doe',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return AppBar(
        backgroundColor: Colors.black,
        title: const Text('logo', style: TextStyle(color: Colors.orange)),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
          ),
        ],
      );
    }
  }
}
