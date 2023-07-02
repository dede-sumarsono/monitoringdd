import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/models/user.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/layanan_screen.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/screens/profile_screen.dart';
import 'package:monitoringdd/screens/register_screen.dart';
import 'package:monitoringdd/services/auth.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua_detail.dart';
import 'package:provider/provider.dart';

import '../utils/color.dart';

class HomeScreenNavBar extends StatefulWidget {
  const HomeScreenNavBar({Key? key}) : super(key: key);

  @override
  State<HomeScreenNavBar> createState() => _HomeScreenNavBarState();
}

class _HomeScreenNavBarState extends State<HomeScreenNavBar> {
  final storage = new FlutterSecureStorage();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    readToken();
    super.initState();
  }

  void readToken() async {
    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).getToken(token: token);
    print(token);
  }

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if(scaffoldKey.currentState!.isDrawerOpen){
        scaffoldKey.currentState!.closeDrawer();
        //close drawer, if drawer is open
      }


    });
  }

  List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    HomeScreen(),
    LayananScreen(),
  ];

  //Auth auth = new Auth();

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Auth>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: orangeLightColor,
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: 'Profile',
                    backgroundColor: orangeDeep

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,color: Colors.white,),
                  label: 'Home',
                  backgroundColor: orangeDeep,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.work,
                    color: Colors.white,
                  ),
                  label: 'Layanan',
                  backgroundColor: orangeDeep,
                ),
              ],
              type: BottomNavigationBarType.shifting,

              currentIndex: _selectedIndex,
              iconSize: 20,
              onTap: _onItemTapped,
              elevation: 2
          ),
        ),
      ),



    );
  }


}
