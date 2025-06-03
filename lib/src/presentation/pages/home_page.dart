import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reckit/src/constants/r.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../domain/entities/trip_entity.dart';
import '../providers/trip_providers.dart';
import '../widgets/trip_list_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsAsyncValue = ref.watch(tripsProvider);

    return Scaffold(
      backgroundColor: R.colors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(76),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: R.colors.background,
            border: Border(
              bottom: BorderSide(color: R.colors.divider, width: 1),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1280),
              child: const CustomAppBar(),
            ),
          ),
        ),
      ),
      body: tripsAsyncValue.when(
        data: (trips) => _buildTripsList(trips),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Error loading trips',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(tripsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripsList(List<TripEntity> trips) {
    if (trips.isEmpty) {
      return const Center(
        child: Text('No trips found', style: TextStyle(fontSize: 18)),
      );
    }

    return TripListWidget(trips: trips);
  }
}
