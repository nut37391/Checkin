import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smartoffice/model/datalist.dart';

import '../model/history.dart';

class checkInProvider with ChangeNotifier {
  CheckInCheckOut? checkInOut;

  final checkInOutBox = Hive.box<datalist>('CheckInoutBox');
  Duration duration = Duration();

  Timer? timer;

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  void addTime() {
    checkInOut?.timecounter = twoDigits(duration.inHours.remainder(60)) +
        ':' +
        twoDigits(duration.inMinutes.remainder(60)) +
        ':' +
        twoDigits(duration.inSeconds.remainder(60));
    checkInOut?.checkOutTime = DateTime.now();

    duration = duration + Duration(seconds: 1);
    notifyListeners();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  get checkInTime {
    if (checkInOut?.checkInTime == null) {
      return 'null';
    }
    return DateFormat.Hm().format(checkInOut!.checkInTime!);
  }

  openHiveBox() async {
    var dataGet = await checkInOutBox.get('aaaa');

    checkInOut = CheckInCheckOut(
        isCheckIn: dataGet?.isCheckIn, checkInTime: dataGet?.checkInTime);

    var timeCont = DateTime.now().difference(dataGet!.checkInTime!);
    duration = timeCont;

    if (dataGet.isCheckIn == true) {
      startTimer();
    }
    print(timeCont);
    notifyListeners();

    print(dataGet.isCheckIn);
  }

  void clearCheckIn() {
    checkInOutBox.deleteAll(['aaaa']);
    notifyListeners();
  }

  void clearTimer() {
    timer?.cancel();
    notifyListeners();
  }

  void resetDuration() {
    duration = Duration();
    notifyListeners();
  }

  void addCheckIn() {
    checkInOut = CheckInCheckOut(checkInTime: DateTime.now());
    checkInOut?.isCheckIn = true;
    saveCheckin();
    print(checkInOutBox.get('aaaa'));
    print(checkInTime);
    notifyListeners();
  }

  void addCheckOut() {
    checkInOut?.checkOutTime = DateTime.now();
    checkInOut?.isCheckIn = false;
    clearTimer();
    resetDuration();
    clearCheckIn();
    print(DateFormat.Hm().format(checkInOut!.checkOutTime!));
    notifyListeners();
  }

  void saveCheckin() async {
    await checkInOutBox.put(
      'aaaa',
      datalist(
        checkInTime: checkInOut?.checkInTime,
        checkOutTime: checkInOut?.checkOutTime,
        isCheckIn: checkInOut?.isCheckIn,
      ),
    );
  }

  void isCheckInChange() {
    checkInOut!.isCheckIn = true;
    notifyListeners();
  }

  void isCheckOutChange() {
    checkInOut!.isCheckIn = false;
    notifyListeners();
  }
}
