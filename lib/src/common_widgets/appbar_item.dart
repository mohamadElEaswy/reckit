import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';

class AppbarItem extends StatelessWidget {
  const AppbarItem({
    super.key,
    required this.text,
    required this.isHighlighted,
  });
  final String text;
  final bool isHighlighted;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
              child: Text(
                text,
                style: TextStyle(
                  color: isHighlighted ? Colors.white : R.colors.unselected,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Visibility(
              visible: isHighlighted,
              child: Container(width: 36, height: 2, color: R.colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
