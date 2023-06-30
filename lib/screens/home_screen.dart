

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    readToken();
    super.initState();
  }

  void readToken() async {

    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context,listen: false)
        .getToken(token: token);
    print(token);
  }


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
}
