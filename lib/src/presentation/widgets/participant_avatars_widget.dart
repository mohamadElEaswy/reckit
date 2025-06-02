import 'package:flutter/material.dart';
import '../../domain/entities/trip_entity.dart';

class AvatarStack extends StatelessWidget {
  final List<ParticipantEntity> participant;
  final int additionalCount;
  final double avatarSize;
  final double overlapOffset;
  final Color borderColor;
  final double borderWidth;
  final Color additionalCountBackgroundColor;
  final TextStyle? additionalCountTextStyle;

  const AvatarStack({
    super.key,
    required this.participant,
    this.additionalCount = 0,
    this.avatarSize = 36.0,
    this.overlapOffset = 16.0,
    this.borderColor = Colors.white,
    this.borderWidth = 2.0,
    this.additionalCountBackgroundColor = Colors.orange,
    this.additionalCountTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: avatarSize * 0.32,
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
      height: avatarSize,
      width: _calculateTotalWidth(),
      child: Stack(
        children: [
          // Avatar images
          ...participant.asMap().entries.map((entry) {
            int index = entry.key;
            String url = entry.value.avatarUrl;

            return Positioned(
              left: index * overlapOffset,
              child: _buildAvatar(
                child: CircleAvatar(
                  radius: (avatarSize - borderWidth * 2) / 2,
                  backgroundImage: NetworkImage(url),
                  backgroundColor: Colors.grey[300],
                ),
              ),
            );
          }),

          // Additional count indicator
          if (additionalCount > 0)
            Positioned(
              left: participant.length * overlapOffset,
              child: _buildAvatar(
                child: CircleAvatar(
                  radius: (avatarSize - borderWidth * 2) / 2,
                  backgroundColor: additionalCountBackgroundColor,
                  child: Text(
                    '+$additionalCount',
                    style: additionalCountTextStyle ?? defaultTextStyle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar({required Widget child}) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: child,
    );
  }

  double _calculateTotalWidth() {
    int totalAvatars = participant.length + (additionalCount > 0 ? 1 : 0);
    if (totalAvatars <= 1) return avatarSize;
    return (totalAvatars - 1) * overlapOffset + avatarSize;
  }
}
