import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/trip_model.dart';

abstract class TripDataSource {
  Future<List<TripModel>> getTrips();
}

class AssetTripDataSource implements TripDataSource {
  static const String _assetPath = 'assets/trips_mock.json';

  @override
  Future<List<TripModel>> getTrips() async {
    try {
      final String jsonString = await rootBundle.loadString(_assetPath);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final TripsResponse response = TripsResponse.fromJson(jsonData);
      return response.trips;
    } catch (e) {
      throw Exception('Failed to load trips from assets: $e');
    }
  }
}
