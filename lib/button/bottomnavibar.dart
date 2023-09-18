import 'package:flutter/material.dart';
import 'package:smartoffice/screen/Account.dart';
import 'package:smartoffice/screen/Checkin.dart';
import 'package:smartoffice/screen/history.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottombar extends StatefulWidget {
  const bottombar({super.key});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
  int _selectedIndex = 0;

  final List<Widget> _pageWidget = <Widget>[
    const checkin(),
    const history(),
    const myAccount(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Image.asset('lib/images/logo/iconUntap.png'),
      activeIcon: Image.asset('lib/images/logo/icon.png'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('lib/images/logo/History.png'),
      activeIcon: Image.asset('lib/images/logo/HistotyonTap.png'),
      label: 'History',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('lib/images/logo/account.png'),
      activeIcon: Image.asset('lib/images/logo/accountOntap.png'),
      label: 'My Account',
    ),
  ];

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        body: _pageWidget.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: _menuBar,
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xffF75772),
          onTap: _onItemTapped,
        ));
  }
}
