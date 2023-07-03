
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


  List _listLayanan = [
    ////peralihan Hak
    'Jual Beli',
    'Waris',
    'Hibah',
    'Tukar Menukar',
    'Pemasukan ke dalam Perusahaan',
    'Merger',
    'Penetapan Pengadilan',
    'Lelang',
    'Pembagian Hak',
    ////Hak Tanggungan
    'Cessie',
    'Subrogasi',
    'Roya',
    'Merger HT',
    //layanan Notaris
    'Akta PerjanjianKawin',
    'Pendirian CV',
    'Pendirian PT',
    'Hibah Merk',

  ];

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


            Expanded(
              child: ListView(
                children: [
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //   children: [
                                                //     Text(
                                                //       'Peralihan Hak',
                                                //       style: TextStyle(
                                                //         color: Colors.white,
                                                //         fontWeight: FontWeight.bold,
                                                //         fontSize: 20,
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                                //
                                                // SizedBox(height: 15,),
                                                //
                                                // SingleChildScrollView(
                                                //   scrollDirection: Axis.horizontal,
                                                //   child: Row(
                                                //     //mainAxisAlignment: MainAxisAlignment.start,
                                                //     children: [
                                                //       for (int i = 1 ; i<5; i++)
                                                //         Padding(
                                                //           padding: EdgeInsets.only(left: 10),
                                                //           child: ClipRRect(
                                                //             borderRadius: BorderRadius.circular(15),
                                                //             child: Image.asset(
                                                //               "assets/img/jualbeli.png",
                                                //               //"assets/img/jualbeli$i.png",
                                                //               height: 120,
                                                //               fit: BoxFit.cover,
                                                //             ),
                                                //           ),
                                                //         )
                                                //     ],
                                                //   ),
                                                // ),

                                            //SizedBox(height: 40,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Peralihan Hak',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  HakTanggunganScroll(0,8,(){}),//untuk peralihan hak
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hak Tanggungan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  HakTanggunganScroll(9,12,(){}),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Layanan Notaris',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  HakTanggunganScroll(13,16,(){}),


                ],
              ),
            )


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



  HakTanggunganScroll(jumlah1,jumlah2,onClick) {
    jumlah2++;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=jumlah1; i<jumlah2; i++)
          InkWell(
            onTap: (){},
            child: Container(
              width: 190,
              height: 300,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                //color: Color(0xFF292B37),
                color: orangeDeep,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    //color: Color(0xFF292B37).withOpacity(0.5),
                    color: Colors.orangeAccent.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 6
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)
                    ),
                    child: Image.asset(
                        'assets/img/ht2.jpg',
                        //'assets/img/ht$i.jpg',
                        height: 180,
                        width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //"Perjanjian Pra Nikah"
                          "${_listLayanan[i]}"
                        ,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("  Hak Tanggungan",
                          style: TextStyle(
                            //color: Colors.white.withOpacity(0.7),
                            color: Colors.white54,
                            //fontSize: 16,
                            fontWeight: FontWeight.w500),
                          ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            SizedBox(width: 5,),
                            Text("8.5",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16
                            ),)

                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
