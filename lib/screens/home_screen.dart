import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/models/user.dart';
import 'package:monitoringdd/screens/home_screen_navbar.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/screens/register_screen.dart';
import 'package:monitoringdd/services/auth.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua_detail.dart';
import 'package:provider/provider.dart';

import '../utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  int _selectedIndex = 0;

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
    HomeScreen(),
    RegisterScreen(),
    LihatSemua(),
  ];

  //Auth auth = new Auth();

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Auth>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: orangeLightColor,
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange, orangeLightColor],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/img/notary.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Hai ' + userdata.user!.username,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.notifications,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Ingin tahu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            'Progress berkas anda ?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          /*Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 100),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search a flight',
                border: OutlineInputBorder(),
              ),
            ),
          ),*/
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
                'Berkas yang anda ajukan',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LihatSemua()));},
                child: Container(
                  child: Text(
                    'Lihat Semua >',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),

                  ),
                ),
              )],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 140,
            decoration: BoxDecoration(
              //color: Color.fromRGBO(28, 94, 133, 100),
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Proses Verifikasi',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pasca Real',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('.....'),
                    Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                    Text('.....'),
                    Text(
                      '0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        //color: Color.fromRGBO(173, 206, 225, 100),
                        color: Color(0xffff4a00),
                        //color: orangeColorSuperLight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Dokumen - Notaris',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            //color: Color.fromRGBO(63, 126, 164, 100),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(0xffff4a00),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Notaris - BPN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pelayanan Notaris',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenNavBar()));
                },
                child: Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              layananNotaris(
                img: 'paris.png',
                city: 'Balik Nama',
                country: 'Perlihan Hak',
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex) => RegisterScreen()));
                },
              ),
              layananNotaris(
                img: 'paris.png',
                city: 'AJB',
                country: 'Peralihan Hak',
                onClick: null,
              ),
              layananNotaris(
                img: 'paris.png',
                city: 'Hak Tanggungan',
                country: 'Peralihan Hak',
                onClick: null,
              ),
            ],
          ),


        ],
      ),
    ),
            /*bottomNavigationBar: Container(
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
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      label: 'Profile',
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
    ),*/

        ////////////////////////////////////LAMA
        /*appBar: AppBar(
        title: Text('Tes'),
      ),
      body: Center(child: Text('Home Screen'),),

      drawer: Drawer(
        child: Consumer<Auth>(builder: (context, auth, child){
          if(!auth.authenticated){
            return ListView(

              children: [ListTile(
                title: Text('Login'),
                leading: Icon(Icons.login),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

                },
              ),]
            );
          }else{
            return ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.blue
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        //backgroundImage: NetworkImage(auth.user.avatar),
                        radius: 30,
                      ),
                      SizedBox(height: 10,),
                      Text(auth.user!.username,
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10,),
                      Text(auth.user!.email,
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),

                ),
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                  onTap: (){
                    Provider.of<Auth>(context,listen: false)
                        .logout();
                  },
                ),
              ],
            );
          }


      })
      ),*/
      drawer: Drawer(
          child: Consumer<Auth>(builder: (context, auth, child){
            if(!auth.authenticated){
              return ListView(

                  children: [ListTile(
                    title: Text('Login'),
                    leading: Icon(Icons.login),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

                    },
                  ),]
              );
            }else{
              return ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Colors.blue
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          //backgroundImage: NetworkImage(auth.user.avatar),
                          radius: 30,
                        ),
                        SizedBox(height: 10,),
                        Text(auth.user!.username,
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 10,),
                        Text(auth.user!.email,
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),

                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: (){
                      Provider.of<Auth>(context,listen: false)
                          .logout();
                    },
                  ),
                ],
              );
            }


          })
      ),

        );
  }

  Widget layananNotaris({img, city, country, onClick}) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.fromLTRB(2, 2, 2, 3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 152,
        width: 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/$img',
              height: 114,
              width: 91,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              city,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              country,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xffff4a00),
                //color: Color.fromRGBO(172, 171, 171, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
