import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';
import 'package:reckit/src/presentation/widgets/trip_card_widget.dart';
import '../../domain/entities/trip_entity.dart';

class TripListWidget extends StatelessWidget {
  final List<TripEntity> trips;

  const TripListWidget({super.key, required this.trips});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 80),
      color: R.colors.background,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${trips.length} trip${trips.length != 1 ? 's' : ''} found',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _getCrossAxisCount(width),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: _responsveChildAspectRatio(width),
              // mainAxisExtent: 500,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final trip = trips[index];
              return TripCardWidget(trip: trip);
            }, childCount: trips.length),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24.0)),
        ],
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    log('$width');
    switch (width) {
      case (> 1400):
        return 5;
      case (> 1300):
        return 3;
      case (> 800):
        return 2;
      case (> 700):
        return 2;
      case (> 600):
        return 1;
      default:
        return 1;
    }
  }

  double _responsveChildAspectRatio(double width) {
    switch (width) {
      case (> 2000):
        return 0.8;
      case (> 1800):
        return 0.70;
      case (> 1700):
        return 0.75;
      case (> 1400):
        return 0.65;
      case (> 1300):
        return .8;
      case (> 1200):
        return .99;
      case (> 1240):
        return .7;
      case (> 1100):
        return .8;
      case (> 1000):
        return .8;
      case (> 900):
        return .8;
      case (> 800):
        return .8;
      case (> 700):
        return .7;
      case (> 600):
        return .99;
      default:
        return .9;
    }
  }
}
