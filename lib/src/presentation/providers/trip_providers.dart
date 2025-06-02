import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/trip_datasource.dart';
import '../../data/repositories/trip_repository_impl.dart';
import '../../domain/entities/trip_entity.dart';
import '../../domain/repositories/trip_repository.dart';
import '../../domain/usecases/get_trips_usecase.dart';

part 'trip_providers.g.dart';

// Data Source Provider
@riverpod
TripDataSource tripDataSource(Ref ref) {
  return AssetTripDataSource();
}

// Repository Provider
@riverpod
TripRepository tripRepository(Ref ref) {
  final dataSource = ref.watch(tripDataSourceProvider);
  return TripRepositoryImpl(dataSource);
}

// Use Cases Providers
@riverpod
GetTripsUseCase getTripsUseCase(Ref ref) {
  final repository = ref.watch(tripRepositoryProvider);
  return GetTripsUseCase(repository);
}

@riverpod
GetTripByIdUseCase getTripByIdUseCase(Ref ref) {
  final repository = ref.watch(tripRepositoryProvider);
  return GetTripByIdUseCase(repository);
}

// State Providers
@riverpod
Future<List<TripEntity>> trips(Ref ref) async {
  final useCase = ref.watch(getTripsUseCaseProvider);
  return await useCase();
}

@riverpod
Future<TripEntity?> tripById(Ref ref, String id) async {
  final useCase = ref.watch(getTripByIdUseCaseProvider);
  return await useCase(id);
}
