import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';
import 'package:reckit/src/presentation/widgets/custom_image_render_web.dart';
import '../../domain/entities/trip_entity.dart';

class AvatarStack extends StatelessWidget {
  final List<ParticipantEntity> participant;
  final int additionalCount;
  final double avatarSize;
  final double overlapOffset;
  final Color? borderColor;
  final double borderWidth;
  final Color? additionalCountBackgroundColor;

  const AvatarStack({
    super.key,
    required this.participant,
    this.additionalCount = 0,
    this.avatarSize = 24.0,
    this.overlapOffset = 8.0,
    this.borderColor,
    this.borderWidth = 1.0,
    this.additionalCountBackgroundColor,
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

                  backgroundColor: Colors.grey[300],
                  child: (kIsWeb)
                      ? ClipRRect(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(100),
                          ),
                          child: CustomImageRenderWeb(url),
                        )
                      : CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorWidget: (context, error, stackTrace) {
                            // log(error);
                            return const Center(
                              child: Icon(
                                Icons.image_not_supported,
                                size: 16,
                                color: Colors.grey,
                              ),
                            );
                          },
                          progressIndicatorBuilder:
                              (context, child, loadingProgress) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              },
                        ),
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
                    style: defaultTextStyle.copyWith(color: R.colors.orange),
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
