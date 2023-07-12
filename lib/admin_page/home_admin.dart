

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitoringdd/admin_page/pick_user.dart';
import 'package:monitoringdd/admin_page/post_data_user.dart';
import 'package:monitoringdd/admin_page/rubah_level_user1.dart';
import 'package:monitoringdd/utils/color.dart';
import 'package:provider/provider.dart';

import '../screens/register_screen.dart';
import '../services/auth.dart';
import '../services/dio.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}


class _HomeAdminState extends State<HomeAdmin> {

  final storage = new FlutterSecureStorage();
  var listRiwayat;


  readRiwayat() async {
    String? token = await storage.read(key: 'token');
    //Provider.of<Auth>(context, listen: false).getToken(token: token);

    Dio.Response response = await dio().get('/jumlahstatuspesanan',
        options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));

    print(response);
    //print(response.data['data'].length);
    //print(response.data['data']);
    //print(response.data['data']['Pendaftar Baru']);
    listRiwayat = response;
  }

  @override
  void initState() {
    // TODO: implement initState
    readRiwayat();

    super.initState();
  }

  List _all = [
    "Pendaftar Baru",
    "Verifikasi Dokumen",
    "Pendaftaran Pajak Oleh Notaris",
    "Pendaftaran Selesai",
    "Proses Real",
    "Proses Pajak",
    "Proses Validasi",
    "Proses Checking",
    "Proses Balik Nama",
    "Proses Peningkatan",
    "Proses HT",
    "Sertifikat Sudah Keluar"
  ];

  List _allIcon = [
    Icons.person_add,
    Icons.verified_outlined,
    Icons.book,
    Icons.done_outline_sharp,
    Icons.schedule,
    Icons.payment,
    Icons.verified_user_sharp,
    Icons.check_circle_outline,
    Icons.near_me,
    Icons.self_improvement,
    Icons.join_right,
    Icons.domain_verification_rounded
  ];



  /*List _allIcon = [
    Icons.person_add,
    Icons.verified_outlined,
    Icons.book,
    Icons.done_outline_sharp,
    Icons.app_registration,
    Icons.app_registration,
    Icons.app_registration,
    Icons.app_registration,
    Icons.app_registration,
    Icons.app_registration,
  ];*/



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
                      Text('Action',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                          color: Colors.black
                      ),),

                      Text('Lihat Semua',style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white
                      ),),

                    ],
                  ),
                ),
              ),



              ////////////////////////////// Action Column
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));},
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0,6),
                                  blurRadius: 12,
                                  spreadRadius: 6
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: orangeDeep,
                          ),
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Spacer(),
                              Icon(Icons.account_circle_rounded,color: Colors.white,size: 50,),
                              Spacer(),
                              Text('Buat Akun User',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(height: 30,)
                              /*Text("Buat Akun User",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.acme("")
                              ),)*/
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PickUser()));},
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0,6),
                                  blurRadius: 12,
                                  spreadRadius: 6
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: orangeDeep,
                          ),
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Spacer(),
                              Icon(Icons.book_outlined,color: Colors.white,size: 50,),
                              Spacer(),
                              Text('Buat Data User',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(height: 30,)
                              /*Text("Buat Akun User",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.acme("")
                              ),)*/
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),


              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RubahLevelUser1()));},
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0,6),
                                  blurRadius: 12,
                                  spreadRadius: 6
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: orangeDeep,
                          ),
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.4,
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Spacer(),
                              Icon(Icons.settings_accessibility,color: Colors.white,size: 50,),
                              Spacer(),
                              Text('Rubah Status \n User',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),),
                              SizedBox(height: 20,)
                              /*Text("Buat Akun User",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.acme("")
                              ),)*/
                            ],
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0,6),
                                blurRadius: 12,
                                spreadRadius: 6
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: orangeDeep,
                        ),
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width*0.4,
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Spacer(),
                            Icon(Icons.file_copy_outlined,color: Colors.white,size: 50,),
                            Spacer(),
                            Text('Rubah Status \n Terdaftar',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),),
                            SizedBox(height: 20,)
                            /*Text("Buat Akun User",
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.acme("")
                            ),)*/
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              ////////////////////////////// Action Column


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

              SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context,index){
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              /*child: Image.asset('assets/img/person2.png',
                                height: 40,
                              ),*/
                              //child: Icon(Icons.person_add_outlined,color: Colors.blue,size: 30,),
                              child: Icon(_allIcon[index],color: Colors.blue,size: 30,),
                            ),
                          //title: Text("Transfer",
                          title: Text("${_all[index]}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                            subtitle: Text("Today",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            //trailing: Text('\$ 56',
                            trailing: Text('${listRiwayat.data["data"][_all[index]]}',
                            //trailing: Text('${listRiwayat.data[_all[index]]}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                fontSize: 19,
                                color: Colors.green
                              ),
                            ),
                          );
                        },
                    childCount: listRiwayat.data["data"].length
                    //childCount: 12

                  )),
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
