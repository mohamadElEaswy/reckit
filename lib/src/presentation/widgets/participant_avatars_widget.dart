import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';
import '../../domain/entities/trip_entity.dart';

class AvatarStack extends StatelessWidget {
  final List<ParticipantEntity> participant;
  final int additionalCount;
  final double avatarSize;
  final double overlapOffset;
  final Color? borderColor;
  final double borderWidth;
  final Color? additionalCountBackgroundColor;
  final TextStyle? additionalCountTextStyle;

  const AvatarStack({
    super.key,
    required this.participant,
    this.additionalCount = 0,
    this.avatarSize = 36.0,
    this.overlapOffset = 16.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.additionalCountBackgroundColor,
    this.additionalCountTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Colors.white,
      fontSize: avatarSize * 0.32,
      fontWeight: FontWeight.bold,
    );

    // Limit to 3 visible avatars
    final visibleParticipants = participant.take(3).toList();
    final remainingCount = participant.length - 3;
    final totalAdditionalCount =
        additionalCount + (remainingCount > 0 ? remainingCount : 0);

    return SizedBox(
      height: avatarSize,
      width: _calculateTotalWidth(),
      child: Stack(
        children: [
          // Avatar images (max 3)
          ...visibleParticipants.asMap().entries.map((entry) {
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
          if (totalAdditionalCount > 0)
            Positioned(
              left: visibleParticipants.length * overlapOffset,
              child: _buildAvatar(
                child: CircleAvatar(
                  radius: (avatarSize - borderWidth * 2) / 2,
                  backgroundColor:
                      additionalCountBackgroundColor ?? R.colors.divider,
                  child: Text(
                    '+$totalAdditionalCount',
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
        border: Border.all(
          color: borderColor ?? R.colors.divider,
          width: borderWidth,
        ),
      ),
      child: child,
    );
  }

  double _calculateTotalWidth() {
    final visibleParticipants = participant.take(3).toList();
    final remainingCount = participant.length - 3;
    final totalAdditionalCount =
        additionalCount + (remainingCount > 0 ? remainingCount : 0);

    int totalAvatars =
        visibleParticipants.length + (totalAdditionalCount > 0 ? 1 : 0);
    if (totalAvatars <= 1) return avatarSize;
    return (totalAvatars - 1) * overlapOffset + avatarSize;
  }
}
