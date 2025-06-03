import 'package:flutter/material.dart';
import '../../domain/entities/trip_entity.dart';

class TripStatusChip extends StatelessWidget {
  final TripStatus status;

  const TripStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusConfig = _getStatusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusConfig.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: statusConfig.borderColor, width: 1),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          color: statusConfig.textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _StatusConfig _getStatusConfig(TripStatus status) {
    switch (status) {
      case TripStatus.proposalSent:
        return _StatusConfig(
          backgroundColor: Colors.blue[900]!.withValues(alpha: 0.3),
          borderColor: Colors.blue[400]!,
          textColor: Colors.blue[300]!,
        );
      case TripStatus.pendingApproval:
        return _StatusConfig(
          backgroundColor: Colors.orange[900]!.withValues(alpha: 0.3),
          borderColor: Colors.orange[400]!,
          textColor: Colors.orange[300]!,
        );
      case TripStatus.readyForTravel:
        return _StatusConfig(
          backgroundColor: Colors.green[900]!.withValues(alpha: 0.3),
          borderColor: Colors.green[400]!,
          textColor: Colors.green[300]!,
        );
      case TripStatus.completed:
        return _StatusConfig(
          backgroundColor: Colors.grey[800]!.withValues(alpha: 0.3),
          borderColor: Colors.grey[500]!,
          textColor: Colors.grey[300]!,
        );
    }
  }
}

class _StatusConfig {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const _StatusConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });
}
