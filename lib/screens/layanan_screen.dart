
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';

class LayananScreen extends StatefulWidget {
  const LayananScreen({Key? key}) : super(key: key);

  @override
  State<LayananScreen> createState() => _LayananScreenState();
}

class _LayananScreenState extends State<LayananScreen> {
  //final userdata = Provider.of<Auth>(context);

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
              height: 30,
            ),
            Text(
              'Apakah anda',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'tertarik dengan layanan kami ?',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),

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
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));},
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
          ],
        ),
      )


      /*Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, orangeLightColor],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),

      ),*/

    );
  }
}
