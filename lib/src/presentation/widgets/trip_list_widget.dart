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
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1280),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: width <= 1280 ? 32.0 : 0,
          ),
          color: R.colors.background,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Items',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            height: 48,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 16),
                          SizedBox(
                            height: 48,
                            width: 177,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Colors.black),
                              label: Text(
                                'Add a New Item',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: R.colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _getCrossAxisCount(width),
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: _responsveChildAspectRatio(
                    width,
                  ), //_responsveChildAspectRatio(width),
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final trip = trips[index];
                  return TripCardWidget(trip: trip);
                }, childCount: trips.length),
              ),
              const SliverPadding(padding: EdgeInsets.only(bottom: 24.0)),
            ],
          ),
        ),
      ),
    );
  }

  int _getCrossAxisCount(double width) {
    log('$width');
    switch (width) {
      case (> 1400):
        return 5;
      case (> 1300):
        return 4;
      case (> 1200):
        return 3;
      case (> 1000):
        return 3;
      case (> 900):
        return 2;
      case (> 700):
        return 1;
      case (> 600):
        return 1;
      default:
        return 1;
    }
  }

  double _responsveChildAspectRatio(double width) {
    switch (_getCrossAxisCount(width)) {
      // case (> 2000):
      //   return 0.8;
      // case (> 1800):
      //   return 0.70;
      // case (> 1700):
      //   return 0.75;
      // case (> 1400):
      //   return 0.65;
      case (== 5):
        return .75;
      case (== 3):
        return 1;
      case (== 2):
        return 1.3;
      case (== 1):
        switch (width) {
          case (> 900):
            return 2.6;
          case (> 800):
            return 2.2;
          case (> 700):
            return 1.9;
          case (> 600):
            return 1.6;
          case (> 500):
            return 1.4;
          case (> 400):
            return 1.1;

          case (> 300):
            return 1.0;
          default:
            return 1.4;
        }
      // case (> 1100):
      //   return .8;
      // case (> 1000):
      //   return .8;
      // case (> 900):
      //   return .8;
      // case (> 800):
      //   return .8;
      // case (> 700):
      //   return .7;
      // case (> 600):
      //   return .99;
      default:
        return .9;
    }
  }
}
