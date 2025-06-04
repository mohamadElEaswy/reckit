import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';
import 'package:reckit/src/domain/entities/trip_entity.dart';
import 'package:reckit/src/presentation/widgets/trip_card_widget/build_card_header.dart';
import 'package:reckit/src/presentation/widgets/trip_card_widget/build_participants.dart';
import 'package:reckit/src/presentation/widgets/trip_card_widget/cover_image.dart';
import 'package:reckit/src/presentation/widgets/trip_card_widget/trip_card_dates.dart';

class TripCardWidget extends StatelessWidget {
  final TripEntity trip;

  const TripCardWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: R.colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 182, child: TripCardCoverImage(trip)),
          SizedBox(
            height: 140,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BuildCardHeaderWidget(trip.title),
                  TripCardDates(trip),
                  Divider(color: R.colors.divider),
                  BuildParticipantsWidget(trip),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
