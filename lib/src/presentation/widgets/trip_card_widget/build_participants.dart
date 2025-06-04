import 'package:flutter/material.dart';
import 'package:reckit/src/domain/entities/trip_entity.dart';
import 'package:reckit/src/presentation/widgets/participant_avatars_widget.dart';

class BuildParticipantsWidget extends StatelessWidget {
  const BuildParticipantsWidget(this.trip, {super.key});
  final TripEntity trip;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AvatarStack(participant: trip.participants),
        _buildTasksInfo(context),
      ],
    );
  }

  Widget _buildTasksInfo(BuildContext context) {
    return Text(
      trip.unfinishedTasks > 0
          ? '${trip.unfinishedTasks} unfinished task${trip.unfinishedTasks != 1 ? 's' : ''}'
          : 'All tasks completed',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.grey[400],
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
    );
  }
}
