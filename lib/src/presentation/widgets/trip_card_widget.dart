import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reckit/src/constants/r.dart';
import 'package:reckit/src/domain/entities/trip_entity.dart';
import 'package:reckit/src/presentation/widgets/participant_avatars_widget.dart';
import 'package:reckit/src/presentation/widgets/trip_status_chip.dart';

class TripCardWidget extends StatelessWidget {
  final TripEntity trip;

  const TripCardWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 420,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: R.colors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: _buildCoverImage()),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 8),
                    _buildDates(context),
                    const SizedBox(height: 12),
                    Divider(color: R.colors.divider),
                    const SizedBox(height: 12),
                    _buildParticipants(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            CachedNetworkImage(
              imageUrl: trip.coverImageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorWidget: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: Colors.grey,
                  ),
                );
              },
              progressIndicatorBuilder: (context, child, loadingProgress) {
                return Container(
                  color: Colors.grey[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            Positioned.fill(
              bottom: -5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      R.colors.grey,
                      R.colors.grey.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.more_horiz, color: Colors.white, size: 24),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 15,
              child: TripStatusChip(status: trip.status),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            trip.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildTasksInfo(BuildContext context) {
    return Text(
      trip.unfinishedTasks > 0
          ? '${trip.unfinishedTasks} unfinished task${trip.unfinishedTasks != 1 ? 's' : ''}'
          : 'All tasks completed',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: trip.unfinishedTasks > 0
            ? Colors.orange[400]
            : Colors.green[400],
        fontWeight: FontWeight.w500,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildParticipants(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.people, size: 24, color: Colors.grey[400]),
        const SizedBox(width: 6),
        Expanded(
          child: AvatarStack(
            participant: trip.participants,
            additionalCount: 6,
          ),
        ),
        _buildTasksInfo(context),
      ],
    );
  }

  Widget _buildDates(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final startDate = dateFormat.format(trip.dates.start);
    final endDate = dateFormat.format(trip.dates.end);
    final duration = trip.dates.end.difference(trip.dates.start).inDays + 1;

    return Row(
      children: [
        Icon(Icons.calendar_today, size: 14, color: Colors.grey[400]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            '$duration Nights ($startDate - $endDate)',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
