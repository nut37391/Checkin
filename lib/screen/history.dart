import 'package:flutter/material.dart';
import 'package:smartoffice/screen/detail.dart';

import '../model/history.dart';

class history extends StatefulWidget {
  const history({Key? key}) : super(key: key);

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final List<HistoryEntry> _historyEntries = [
    HistoryEntry(
        mouth: "Jan",
        data: ["Mon, 10-10-2018", "Mon, 11-10-2018", "Mon, 12-10-2018"]),
    HistoryEntry(mouth: "Feb", data: [" Tus, 11-10-2018", " Tus, 12-10-2018"]),
    HistoryEntry(mouth: "Feb", data: [" Tus, 11-10-2018"]),
    HistoryEntry(mouth: "Feb", data: [" Tus, 11-10-2018"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _historyEntries.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 390,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(255, 224, 223, 223),
                        width: 1,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    _historyEntries[index].mouth,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ..._historyEntries[index].data.map((date) {
                  var isLast = _historyEntries[index].data.last == date;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detail(),
                        ),
                      );
                    },
                    child: Container(
                      width: 390,
                      height: 72,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isLast
                                ? Color.fromARGB(255, 224, 223, 223)
                                : Color.fromARGB(255, 240, 239, 239),
                            width: 1,
                          ),
                        ),
                        color: Colors.white,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ));
  }
}
