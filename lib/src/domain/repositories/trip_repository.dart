import '../entities/trip_entity.dart';

abstract class TripRepository {
  Future<List<TripEntity>> getTrips();
  Future<TripEntity?> getTripById(String id);
  Future<void> updateTrip(TripEntity trip);
  Future<void> deleteTrip(String id);
}
