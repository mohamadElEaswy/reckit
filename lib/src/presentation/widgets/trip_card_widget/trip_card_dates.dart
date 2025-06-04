import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reckit/src/domain/entities/trip_entity.dart';

class TripCardDates extends StatelessWidget {
  const TripCardDates(this.trip, {super.key});
  final TripEntity trip;

  @override
  Widget build(BuildContext context) {
    dateFormat(bool withYear) =>
        DateFormat(withYear ? 'MMM dd, yyyy' : 'MMM dd');
    final startDate = dateFormat(false).format(trip.dates.start);
    final endDate = dateFormat(true).format(trip.dates.end);
    final duration = trip.dates.end.difference(trip.dates.start).inDays + 1;
    return Row(
      children: [
        Image.asset('assets/icons/calender.png', height: 16, width: 16),
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
