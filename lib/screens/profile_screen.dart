
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';
import '../utils/textStyle.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Auth>(context);
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Text(
              '       Detail',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/img/person2.png'),
                  ),
                  SizedBox(width: 10,),
                  Text("${userdata.user?.username}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),




            Container(
              padding: EdgeInsets.all(20),
              //height: 140,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                //color: Color.fromRGBO(28, 94, 133, 100),
                //color: Colors.white54,
                //color: Color(0xffff4a00).withOpacity(0.7),
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text(
                        'Username',
                        style: isianDBTS
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '      ${userdata.user?.username}',
                         style: isianDBTS
                      ),

                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.mail,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text(
                        'E-mail',
                        style: isianDBTS
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '      ${userdata.user?.email}',
                        style: isianDBTS
                      ),
                    ],
                  ),



                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.call,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text(
                          'Nomor Telepon',
                          style: isianDBTS
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          '      ${userdata.user?.notelepon}',
                          style: isianDBTS
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.verified_user_sharp,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text(
                          'Status',
                          style: isianDBTS
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      userdata.user?.level == 2 ?
                      Text(
                          '      User',
                          style: isianDBTS
                      ):Text(
                          '      Admin',
                          style: isianDBTS
                      )
                    ],
                  ),


                ],
              ),
            ),





          ],
        ),
      ),
    );
  }


}
