import 'package:flutter/material.dart';
import 'package:smartoffice/button/bottomnavibar.dart';
import 'package:provider/provider.dart';
import 'package:smartoffice/model/datalist.dart';

import 'package:smartoffice/screen/checkinprovider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smartoffice/screen/Checkin.dart';
import 'package:smartoffice/screen/Login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(datalistAdapter());
  await Hive.openBox<datalist>('CheckInoutBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => checkInProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: loginpage(),
      home: bottombar(),
    );
  }
}
