import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/layanan_screen.dart';
import 'package:monitoringdd/screens/profile_screen.dart';
import 'package:monitoringdd/services/auth.dart';
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
    setState(() {
      print('refresh');
    });
    super.initState();
  }

  void readToken() async {
    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).getToken(token: token);
    print(token);
  }

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if(mounted){
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(),
    HomeScreen(),
    LayananScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: _selectedIndex == 0? Colors.white:orangeLightColor,
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
