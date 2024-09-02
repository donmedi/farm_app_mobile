import 'package:farm_loan_app/constant/color_const.dart';
import 'package:farm_loan_app/views/account/account_screen.dart';
import 'package:farm_loan_app/views/dashboard/dashboard.dart';
import 'package:farm_loan_app/views/transactions/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainBottomNav extends StatefulWidget {
  final int currentIndex;
  MainBottomNav({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _MainBottomNavState createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  Color _activeColor = ColorConst.mainPrimaryColor;
  Color _inActiveColor = Color(0xff727578);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    DahsboardScreen(),
    TransactionScreen(),
    AccountScreen()
  ];

  void _setNewIndex() {
    setState(() {
      _selectedIndex = widget.currentIndex;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  initState() {
    super.initState();
    _setNewIndex();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.home,
              size: 22.sp,
              color: _selectedIndex == 0
                  ? ColorConst.mainPrimaryColor
                  : _inActiveColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.fileText,
              size: 22.sp,
              color: _selectedIndex == 1
                  ? ColorConst.mainPrimaryColor
                  : _inActiveColor,
            ),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FeatherIcons.user,
              size: 22.sp,
              color: _selectedIndex == 2
                  ? ColorConst.mainPrimaryColor
                  : _inActiveColor,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            fontFamily: 'Lato',
            color: ColorConst.mainPrimaryColor),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 12.sp, fontFamily: 'Lato'),
        selectedItemColor: _activeColor,
        unselectedItemColor: _inActiveColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
