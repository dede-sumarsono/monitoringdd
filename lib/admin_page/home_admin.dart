

import 'package:flutter/material.dart';
import 'package:monitoringdd/admin_page/pick_user.dart';
import 'package:monitoringdd/admin_page/post_data_user.dart';
import 'package:monitoringdd/admin_page/rubah_level_user1.dart';

import '../screens/register_screen.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
            }, child: Text('Buat kan user')),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDataUser()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUser()));
            }, child: Text('Buat data user')),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RubahLevelUser1()));
            }, child: Text('Rubah Status')),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RubahLevelUser1()));
            }, child: Text('Rubah Status Post')),

            SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }
}
