class TripEntity {
  final String id;
  final TripStatus status;
  final String title;
  final TripDates dates;
  final List<ParticipantEntity> participants;
  final int unfinishedTasks;
  final String coverImageUrl;

  const TripEntity({
    required this.id,
    required this.status,
    required this.title,
    required this.dates,
    required this.participants,
    required this.unfinishedTasks,
    required this.coverImageUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripEntity &&
        other.id == id &&
        other.status == status &&
        other.title == title &&
        other.dates == dates &&
        other.participants == participants &&
        other.unfinishedTasks == unfinishedTasks &&
        other.coverImageUrl == coverImageUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      status,
      title,
      dates,
      participants,
      unfinishedTasks,
      coverImageUrl,
    );
  }
}

class TripDates {
  final DateTime start;
  final DateTime end;

  const TripDates({required this.start, required this.end});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripDates && other.start == start && other.end == end;
  }

  @override
  int get hashCode => Object.hash(start, end);
}

class ParticipantEntity {
  final String name;
  final String avatarUrl;

  const ParticipantEntity({required this.name, required this.avatarUrl});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ParticipantEntity &&
        other.name == name &&
        other.avatarUrl == avatarUrl;
  }

  @override
  int get hashCode => Object.hash(name, avatarUrl);
}

enum TripStatus {
  proposalSent('Proposal Sent'),
  pendingApproval('Pending Approval'),
  readyForTravel('Ready for travel'),
  completed('Completed');

  const TripStatus(this.displayName);
  final String displayName;

  static TripStatus fromString(String status) {
    return TripStatus.values.firstWhere(
      (e) => e.displayName == status,
      orElse: () => TripStatus.proposalSent,
    );
  }
}
