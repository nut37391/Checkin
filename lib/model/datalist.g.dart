// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datalist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class datalistAdapter extends TypeAdapter<datalist> {
  @override
  final int typeId = 0;

  @override
  datalist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return datalist(
      checkInTime: fields[0] as DateTime?,
      checkOutTime: fields[1] as DateTime?,
      workDurationHours: fields[2] as String?,
      workDurationMinutes: fields[3] as String?,
      isCheckIn: fields[4] as bool?,
      timecounter: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, datalist obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.checkInTime)
      ..writeByte(1)
      ..write(obj.checkOutTime)
      ..writeByte(2)
      ..write(obj.workDurationHours)
      ..writeByte(3)
      ..write(obj.workDurationMinutes)
      ..writeByte(4)
      ..write(obj.isCheckIn)
      ..writeByte(5)
      ..write(obj.timecounter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is datalistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
