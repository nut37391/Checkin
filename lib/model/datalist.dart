import 'package:hive/hive.dart';
part 'datalist.g.dart';

@HiveType(typeId: 0)
class datalist extends HiveObject {
  @HiveField(0)
  DateTime? checkInTime;
  @HiveField(1)
  DateTime? checkOutTime;
  @HiveField(2)
  String? workDurationHours;
  @HiveField(3)
  String? workDurationMinutes;
  @HiveField(4)
  bool? isCheckIn = false;
  @HiveField(5)
  String? timecounter;

  datalist({
    this.checkInTime,
    this.checkOutTime,
    this.workDurationHours,
    this.workDurationMinutes,
    this.isCheckIn = false,
    this.timecounter,
  });
}
