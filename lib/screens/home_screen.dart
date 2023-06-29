

import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        radius: 30,
                      ),
                      SizedBox(height: 10,),
                      Text('Dede Sumarsono',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10,),
                      Text('dede@gmail.com'
                          ''
                          ''
                          '',
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
}
