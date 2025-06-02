import '../../domain/entities/trip_entity.dart';
import '../../domain/repositories/trip_repository.dart';
import '../datasources/trip_datasource.dart';
import '../models/trip_model.dart';

class TripRepositoryImpl implements TripRepository {
  final TripDataSource _dataSource;

  const TripRepositoryImpl(this._dataSource);

  @override
  Future<List<TripEntity>> getTrips() async {
    try {
      final List<TripModel> tripModels = await _dataSource.getTrips();
      return tripModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get trips: $e');
    }
  }

  @override
  Future<TripEntity?> getTripById(String id) async {
    try {
      final List<TripEntity> trips = await getTrips();
      return trips.where((trip) => trip.id == id).firstOrNull;
    } catch (e) {
      throw Exception('Failed to get trip by id: $e');
    }
  }

  @override
  Future<void> updateTrip(TripEntity trip) async {
    // Implementation would depend on the actual data storage mechanism
    // For now, this is a placeholder as we're only reading from assets
    throw UnimplementedError(
      'Update trip not implemented for asset data source',
    );
  }

  @override
  Future<void> deleteTrip(String id) async {
    // Implementation would depend on the actual data storage mechanism
    // For now, this is a placeholder as we're only reading from assets
    throw UnimplementedError(
      'Delete trip not implemented for asset data source',
    );
  }
}
