import 'package:intl/intl.dart';
import '../../domain/entities/trip_entity.dart';

class TripsResponse {
  final List<TripModel> trips;

  const TripsResponse({required this.trips});

  factory TripsResponse.fromJson(Map<String, dynamic> json) => TripsResponse(
    trips: List<TripModel>.from(
      json['trips'].map((x) => TripModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'trips': List<dynamic>.from(trips.map((x) => x.toJson())),
  };
}

class TripModel {
  final String id;
  final String status;
  final String title;
  final TripDatesModel dates;
  final List<ParticipantModel> participants;
  final int unfinishedTasks;
  final String coverImage;

  const TripModel({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImage,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
    id: json['id'],
    status: json['status'],
    title: json['title'],
    dates: TripDatesModel.fromJson(json['dates']),
    participants: List<ParticipantModel>.from(
      json['participants'].map((x) => ParticipantModel.fromJson(x)),
    ),
    unfinishedTasks: json['unfinished_tasks'],
    coverImage: json['cover_image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'title': title,
    'dates': dates.toJson(),
    'participants': List<dynamic>.from(participants.map((x) => x.toJson())),
    'unfinished_tasks': unfinishedTasks,
    'cover_image': coverImage,
  };

  TripEntity toEntity() {
    return TripEntity(
      id: id,
      status: TripStatus.fromString(status),
      title: title,
      dates: dates.toEntity(),
      participants: participants.map((p) => p.toEntity()).toList(),
      unfinishedTasks: unfinishedTasks,
      coverImageUrl: coverImage,
    );
  }

  factory TripModel.fromEntity(TripEntity entity) {
    return TripModel(
      id: entity.id,
      status: entity.status.displayName,
      title: entity.title,
      dates: TripDatesModel.fromEntity(entity.dates),
      participants: entity.participants
          .map((p) => ParticipantModel.fromEntity(p))
          .toList(),
      unfinishedTasks: entity.unfinishedTasks,
      coverImage: entity.coverImageUrl,
    );
  }
}

class TripDatesModel {
  final String start;
  final String end;

  const TripDatesModel({required this.start, required this.end});

  factory TripDatesModel.fromJson(Map<String, dynamic> json) =>
      TripDatesModel(start: json['start'], end: json['end']);

  Map<String, dynamic> toJson() => {'start': start, 'end': end};

  TripDates toEntity() {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return TripDates(
      start: dateFormat.parse(start),
      end: dateFormat.parse(end),
    );
  }

  factory TripDatesModel.fromEntity(TripDates entity) {
    final dateFormat = DateFormat('dd-MM-yyyy');
    return TripDatesModel(
      start: dateFormat.format(entity.start),
      end: dateFormat.format(entity.end),
    );
  }
}

class ParticipantModel {
  final String name;
  final String avatarUrl;

  const ParticipantModel({required this.name, required this.avatarUrl});

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      ParticipantModel(name: json['name'], avatarUrl: json['avatar_url']);

  Map<String, dynamic> toJson() => {'name': name, 'avatar_url': avatarUrl};

  ParticipantEntity toEntity() {
    return ParticipantEntity(name: name, avatarUrl: avatarUrl);
  }

  factory ParticipantModel.fromEntity(ParticipantEntity entity) {
    return ParticipantModel(name: entity.name, avatarUrl: entity.avatarUrl);
  }
}
