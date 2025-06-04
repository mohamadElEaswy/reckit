import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reckit/src/constants/r.dart';
import 'package:reckit/src/domain/entities/trip_entity.dart';
import 'package:reckit/src/presentation/widgets/trip_status_chip.dart';

class TripCardCoverImage extends StatelessWidget {
  const TripCardCoverImage(this.trip, {super.key});
  final TripEntity trip;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
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
                        R.colors.grey.withValues(alpha: 0.40),
                      ],
                      stops: [0.1, .60],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/icons/more.png'),
                    ),
                  ),
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
      ),
    );
  }
}
