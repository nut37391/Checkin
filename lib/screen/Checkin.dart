import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartoffice/screen/checkinprovider.dart';

class checkin extends StatefulWidget {
  const checkin({super.key});

  @override
  State<checkin> createState() => _checkinState();
}

class _checkinState extends State<checkin> {
  var showDuration = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(Provider.of<checkInProvider>(context, listen: false).openHiveBox());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<checkInProvider>(
      builder: (context, provider, child) {
        final hour = provider.duration.inHours;
        final minutes = provider.duration.inMinutes.remainder(60);

        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text('Time Stamp',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: Text('Wed, 10 Jan 2018',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Please stay in bracon area and tap ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('the button to check in',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    if (provider.checkInOut?.isCheckIn == false)
                      Container(
                        height: 180,
                      ),
                    if (provider.checkInOut?.isCheckIn == true)
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 295,
                        height: 160,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    'at Office',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff8a8a8a),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20, right: 20),
                                  child: Text('IN',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff69B0FE),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5, left: 20),
                                  child: Text(provider.checkInTime.toString(),
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff69B0FE),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                      '--------------------------------------',
                                      style: TextStyle(
                                        color: Color(0xffe2e2e2),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, left: 20),
                                  child: Text(
                                    'Work Hours ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff8a8a8a),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 5, bottom: 5, right: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        '$hour Hours',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff8a8a8a),
                                        ),
                                      ),
                                      Text(
                                        ' $minutes Minutes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff8a8a8a),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 40,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 160,
                          height: 52,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFF75772),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                provider.addCheckIn();
                                provider.startTimer();
                              });
                            },
                            child: Text('CLOCK IN'),
                          ),
                        ),
                        if (provider.checkInOut?.isCheckIn == true)
                          Container(
                            width: 160,
                            height: 52,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xFFF75772),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  showDuration = true;
                                  provider.addCheckOut();
                                });
                              },
                              child: Text('CLOCK OUT'),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    top: 165,
                    left: 200,
                    child: Image.asset('lib/images/logo/Shape.png',
                        width: 235, height: 235)),
              ],
            ),
          ),
        );
      },
    );
  }
}
