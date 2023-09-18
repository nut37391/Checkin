class HistoryEntry {
  String mouth;
  List<String> data = [];

  HistoryEntry({required this.mouth, this.data = const []});
}

class CheckInCheckOut {
  DateTime? checkInTime;
  DateTime? checkOutTime;
  bool? isCheckIn = false;
  String? timecounter;

  CheckInCheckOut({
    this.checkInTime,
    this.checkOutTime,
    this.isCheckIn = false,
    this.timecounter,
  });

  String get workDurationHours {
    final HH = checkOutTime!.difference(checkInTime!).inHours;

    if (checkOutTime != null) {
      return '$HH';
    }
    return 'null';
  }

  String get workDurationMinutes {
    final mm = (checkOutTime!.difference(checkInTime!).inMinutes % 60)
        .toString()
        .padLeft(2, '0');

    if (checkOutTime != null) {
      return '$mm';
    }
    return 'null';
  }
}
