

import 'package:flutter/material.dart';
import 'package:monitoringdd/admin_page/pick_user.dart';
import 'package:monitoringdd/admin_page/post_data_user.dart';
import 'package:monitoringdd/admin_page/rubah_level_user1.dart';
import 'package:monitoringdd/utils/color.dart';

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
      //backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child:
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 350, child: _head()),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Data Riwayat',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: Colors.black
                      ),),

                      Text('Lihat Semua',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey
                      ),),

                    ],
                  ),
                ),
              ),
            ],
          )

      )
















      /*Center(
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
      ),*/














    );
  }

  Widget _head(){
    return Stack(
      children: [
        Column(
          children: [
            Container(
              //color: Colors.red,
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: orangeLightColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: 5,
                      left: 330,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: orangeDeep,
                          child: Icon(
                            Icons.notification_add_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 35,left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Good Afternoon',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.8)
                          ),),
                        Text('Dede Sumarsono',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white
                          ),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        Positioned(
          top: 140,
          left: 37,
          child: Container(
            height: 170,
            width: 320,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: orangeDark,
                      offset: Offset(0,6),
                      blurRadius: 12,
                      spreadRadius: 6
                  )
                ],
                color: orangeDeep,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Terdaftar',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white
                        ),),
                      Icon(Icons.more_horiz,
                        color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(height: 7,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text('\$ 2,957'
                        ,style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white38,
                            child: Icon(Icons.arrow_downward,color: Colors.white,size: 19,),
                          ),
                          SizedBox(width: 7,),
                          Text('Proses',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white38,
                            child: Icon(Icons.arrow_upward,color: Colors.white,size: 19,),
                          ),
                          SizedBox(width: 7,),
                          Text('Selesai',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 6,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('10',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),),

                      Text('10',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),)


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

}
