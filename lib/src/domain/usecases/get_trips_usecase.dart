import '../entities/trip_entity.dart';
import '../repositories/trip_repository.dart';

class GetTripsUseCase {
  final TripRepository _repository;

  const GetTripsUseCase(this._repository);

  Future<List<TripEntity>> call() async {
    return await _repository.getTrips();
  }
}

class GetTripByIdUseCase {
  final TripRepository _repository;

  const GetTripByIdUseCase(this._repository);

  Future<TripEntity?> call(String id) async {
    return await _repository.getTripById(id);
  }
}
