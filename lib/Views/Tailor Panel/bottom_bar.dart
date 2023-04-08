import 'package:flutter/material.dart';

import '../../Screens/Tailor Panel/notification.dart';
import '../../Screens/Tailor Panel/tailor_profile.dart';
import 'darwer.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late bool _dark;
  @override
  void initState() {
    super.initState();
    _dark = false;
  }

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }
  int _selectedindex = 0;

  static final List<Widget>_widgetOption = <Widget>[

    //home
    // TailorHomeView(),

      //notification
    TailorNotification(),


    // profile
    TailorProfile(),

  ];
  void _onItemTapped(int index){
  setState(() {
    _selectedindex = index;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
       drawer: Drawer(
         width: 250,
         backgroundColor: Colors.blue[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50)),
            ),
            child: CustomDrawer(),
        ),

        appBar: AppBar(
          elevation: 0,

          backgroundColor: Colors.blue[300],
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("LET'S DO LACE'S TOGETHER",style: TextStyle(fontSize: 15),),
          ),

        ),


        body: Center(
          child: _widgetOption[_selectedindex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: BottomNavigationBar(
            backgroundColor: Colors.blue[50],

            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',

              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',

              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedindex,
            selectedItemColor: Colors.blue[300],
            unselectedItemColor: Colors.black54,

            onTap: _onItemTapped,
          ),
        ),

      ),
    );
  }
}
