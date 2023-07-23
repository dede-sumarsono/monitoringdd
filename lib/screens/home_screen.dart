
import 'dart:async';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:monitoringdd/admin_page/home_admin.dart';
import 'package:monitoringdd/screens/layanan_screen.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/services/auth.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/dio.dart';
import '../sub_menu_user/layanan_detail.dart';
import '../utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = new FlutterSecureStorage();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var score;
  var score2;

  final List<Map<String, dynamic>> _allLayanan = [
    {"id": 0, "layanan": "Jual Beli",                     "waktu":"4 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/jualbeli2.jpg", "deskripsi":"Bisa disebut dengan PJB atau Pengikatan Jual Beli merupakan kesepakatan antara penjual untuk menjual properti miliknya kepada pembeli yang dibuat dengan akta notaris. PJB bisa dibuat karena alasan tertentu, seperti belum lunasnya pembayaran harga jual beli dan belum dibayarkannya pajak-pajak yang timbul karena jual beli"},
    {"id": 1, "layanan": "Waris",                         "waktu":"2 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/waris.jpg", "deskripsi":"Notaris dalam pembagian warisan berperan dalam pembuatan Akta Pernyataan Waris dan Surat Keterangan Hak Waris. Apabila terjadi sengketa, Notaris dapat membuatkan akta-akta perdamaian dan/atau perjanjian pelepasan hak tuntutan"},
    {"id": 2, "layanan": "Hibah",                         "waktu":"1 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/hibah.png", "deskripsi":"Akta hibah adalah dokumen penting yang memiliki kekuatan hukum atas pemberian barang atau tanah kepada orang lain. Pada umumnya penerima surat hibah wasiat adalah orang pribadi yang masih dalam hubungan keluarga dengan pemberi hibah wasiat, atau orang pribadi yang tidak mampu"},
    {"id": 3, "layanan": "Tukar Menukar",                 "waktu":"1 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/tukarmenukar.jpg", "deskripsi":"Tukar menukar ini dapat diartikan sebagai suatu perjanjian yang dibuat antara pihak yang satu dengan pihak lainnya, dalam perjanjian itu pihak yang satu berkewajiban menyerahkan hak atas tanah yang ditukar, begitu pula pihak lainnya yang berhak menerima hak atas tanah yang ditukar"},
    {"id": 4, "layanan": "Pemasukan ke dalam Perusahaan", "waktu":"5 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/pemasukandalamperusahaan.jpg", "deskripsi":"Pemasukan ke dalam perusahaan adalah jumlah uang atau nilai ekonomi lainnya yang diterima oleh perusahaan sebagai hasil dari aktivitas operasionalnya. Pemasukan ini bisa berasal dari beberapa sumber, termasuk penjualan produk atau jasa, pendapatan bunga, dividen, komisi, atau penghasilan dari investasi lainnya. Biasanya ini digunakan untuk menetapkan pendapatan perusahaan yang ada akan diberikan pada pihak mana"},
    {"id": 5, "layanan": "Merger",                        "waktu":"2 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/merger.jpg", "deskripsi":"Dalam merger, terjadi penggabungan antara satu perseroan dengan perseroan lain yang menghilangkan status badan hukum perseroan-perseroan yang menggabungkan diri dan menghasilkan terbentuknya satu perseroan baru"},
    {"id": 6, "layanan": "Penetapan Pengadilan",          "waktu":"2 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/tetapanperadilan.png", "deskripsi":"Dokumen ini di peruntukan sebagai penetapan dari keputusan sidang yang ingin anda ajukan setelah proses pengadilan selesai"},
    {"id": 7, "layanan": "Lelang",                        "waktu":"1 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/lelang.jpg", "deskripsi":"adalah berita acara pelaksanaan lelang yang dibuat oleh pejabat lelang yang merupakan akta otentik dan mempunyai kekuatan pembuktian sempurna. Kewenangan Notaris sebagai Pejabat Lelang Kelas II dalam Memberikan Penyuluhan Hukum atas akta risalah lelang yang dibuatnya"},
    {"id": 8, "layanan": "Pembagian Hak",                 "waktu":"3 Bulan", "jenis_layanan": 'Peralihan Hak',"foto": "assets/img/pembagianhak.jpg", "deskripsi":"Bisa disebut dengan APHB (Akta Pembagian Hak Bersama) adalah dokumen yang diperlukan untuk melepas atau mengubah hak bersama, menjadi hak individu atas tanah atau Hak Milik Atas Satuan Rumah Susun (HMRS). Dokumen ini biasanya dibutuhkan dalam pembagian harta warisan berupa tanah dan/atau bangunan, dengan ahli waris lebih dari satu orang"},

    {"id": 9, "layanan": "Cessie",                        "waktu":"2 Minggu", "jenis_layanan": 'Hak Tanggungan',"foto": "assets/img/cessie.jpg", "deskripsi":"Cessie adalah suatu cara pemindahan piutang atas nama dimana piutang itu dijual oleh kreditur lama kepada orang yang nantinya menjadi kreditur baru, namun hubungan hukum utang piutang tersebut tidak hapus sedetikpun, tetapi dalam keseluruhannya dipindahkan kepada kreditur baru"},
    {"id": 10, "layanan": "Subrogasi",                    "waktu":"3 Bulan",  "jenis_layanan": 'Hak Tanggungan',"foto": "assets/img/subrogasi.jpg", "deskripsi":"Subrogasi adalah Penggantian hak–hak oleh pihak ketiga yang membayar kepada Kreditur"},
    {"id": 11, "layanan": "Roya",                         "waktu":"1 Minggu", "jenis_layanan": 'Hak Tanggungan',"foto": "assets/img/roya2.jpg", "deskripsi":"Roya adalah pencoretan pada buku tanah Hak Tanggungan karena hak tanggungan telah hapus. Hak Tanggungan dalam roya adalah hak jaminan atas tanah untuk pelunas utang tertentu, yang memberikan kedudukan diutamakan kepada kreditur tertentu terhadap kreditur-kreditur lain"},
    {"id": 12, "layanan": "Merger HT",                    "waktu":"3 Bulan",  "jenis_layanan": 'Hak Tanggungan',"foto": "assets/img/mergerht.png", "deskripsi":"merupakan kesepakatan antara kedua belah pihak untuk penyelesaian masalah Hak Tanggungan"},

    {"id": 13, "layanan": "Akta Perjanjian Kawin",        "waktu":"2 Minggu", "jenis_layanan": 'Layanan Notaris',"foto": "assets/img/ht2.jpg",  "deskripsi":"Bisa juga disebut dengan Perjanjian Pra Nikah adalah salah satu bentuk dari perjanjian yang dibuat antara satu pihak dengan pihak lainnya sebelum mengadakan upacara pernikahan untuk mengesahkan keduanya sebagai pasangan suami dan istri"},
    {"id": 14, "layanan": "Pendirian CV",                 "waktu":"1 Bulan",  "jenis_layanan": 'Layanan Notaris',"foto": "assets/img/pendiriancv.png", "deskripsi":"Akta pendirian CV atau akta notaris merupakan sebuah dokumen yang berfungsi sebagai bukti peristiwa. Dalam hal ini, akta pendirian CV akan menjadi bukti sah pendirian sebuah CV. Akta pendirian CV sendiri berisi seluruh informasi resmi yang berkaitan dengan profil usaha, tujuan, hingga kegiatan usaha"},
    {"id": 15, "layanan": "Pendirian PT",                 "waktu":"2 Bulan",  "jenis_layanan": 'Layanan Notaris',"foto": "assets/img/pendirianpt.jpg", "deskripsi":"Akta Pendirian PT atau Perseroan Terbatas adalah akta yang dibuat dihadapan Notaris, yang berisi keterangan mengenai kesepakatan dan identitas para pihak untuk mendirikan PT beserta Anggaran Dasarnya"},
    {"id": 16, "layanan": "Hibah Merk",                   "waktu":"2 Bulan",  "jenis_layanan": 'Layanan Notaris',"foto": "assets/img/hibahmerk.jpg", "deskripsi":"Pengalihan hak atas merek diatur di dalam Pasal 41 Undang- Undang Nomor 20 Tahun 2016, yang dalam hal ini hak atas merek terdaftar dapat beralih atau dialihkan karena hibah wasiat yang dalam hal ini setelah pengalihan hak atas merek terjadi, harus diikuti dengan penyerahan. Notaris akan menerbitkan Akta Hibah Merk"},
  ];

    final String urlMaps = 'https://goo.gl/maps/vz2HzvAmwd1PtNF79';

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  void initState() {
    readToken();
    readScore();
    super.initState();
  }

  void readToken() async {
    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).getToken(token: token);
    print(token);
  }


  void readScore() async {
    //print('user id adalah $id');
    String? token = await storage.read(key: 'token');
    final hasil = await Provider.of<Auth>(context, listen: false).getId(token: token);
    final hasil2 = await Provider.of<Auth>(context, listen: false).getId2(token: token);
    print('jadi hasilnya adalah $hasil');
    print('jadi hasilnya adalah $hasil2');



    new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if(hasil2 != null){
        setState(() {
            score = hasil;
            score2 = hasil2;
          });

      }else{
        //readScore();
      }
      timer.cancel();
    });

  }





  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Auth>(context);

    new Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if(score2 == null){
        readScore();
      }else{
        timer.cancel();
      }
    });

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: orangeLightColor,
      body:
      userdata.user!.username == null ? Center(child: CircularProgressIndicator(
      //score2 == null ? Center(child: CircularProgressIndicator(
        color: Colors.white,)) :
      Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange, orangeLightColor],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    InkWell(
                      onTap: (){
                        /*if(scaffoldKey.currentState!.isDrawerOpen){
                          scaffoldKey.currentState!.closeDrawer();
                          //close drawer, if drawer is open
                        }else{
                          scaffoldKey.currentState!.openDrawer();
                          //open drawer, if drawer is closed
                        }*/
                      },
                      child: Image.asset(
                        'assets/img/notary.png',
                        height: 40,
                        width: 40,
                      ),
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
                  //color: Colors.white,
                  color: Colors.transparent,
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
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: (){
                    //print(userdata.user!.email);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LihatSemua(idx:userdata.user!.id)));
                    },
                  child: Container(
                    child: Text(
                      'Lihat Semua ',
                      style: TextStyle(
                        //color: Colors.white,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
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
                      score == null ? CircularProgressIndicator(color: Colors.white,):
                      Text(
                        '$score',
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

                      score2 == null ? CircularProgressIndicator(color: Colors.white,): Text(
                        //'0',
                        '$score2',
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
                        //width: 150,
                        width: MediaQuery.of(context).size.width*0.35,
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
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              //color: Color.fromRGBO(63, 126, 164, 100),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        //width: 150,
                        width: MediaQuery.of(context).size.width*0.35,
                        decoration: BoxDecoration(
                          color: Color(0xffff4a00),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Notaris - BPN',
                            style: TextStyle(
                              fontSize: 11,
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreenNavBar()));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LayananScreen()));
                  },
                  child: Text(
                    'Lihat semua',
                    style: TextStyle(
                      //color: Colors.white,
                      color: Colors.white70,
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
            HakTanggunganScroll(13,17,(){}),

            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kantor Notaris',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),



            //////////////////////////////////////////// foto kantor
        Center(
          child: Container(
            //width: 190,
            //height: 300,
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
                  borderRadius: BorderRadius.all(Radius.circular(10)
                      //topRight: Radius.circular(10),
                      //topLeft: Radius.circular(10)
                  ),
                  child: Image.asset(
                    'assets/img/kantornotaris.jpg',
                    //height: 180,
                    //width: 190,
                    width: MediaQuery.of(context).size.width*0.7,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),),
        ),
            //////////////////////////////////////////// foto kantor

            SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.email_rounded,color: Colors.white,),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          //final Uri url = Uri.parse("https://goo.gl/maps/vz2HzvAmwd1PtNF79");
                          //launchUrl(url);
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: 'nilakandijanuarti@gmail.com',
                            query: encodeQueryParameters(<String, String>{
                              'subject': 'Example Subject & Symbols are allowed!',
                            }),
                          );

                          launchUrl(emailLaunchUri);



                        },
                        child: Text(
                          'nilakandijanuarti@gmail.com',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          final Uri url = Uri.parse("https://goo.gl/maps/vz2HzvAmwd1PtNF79");
                          launchUrl(url);

                        },
                        child: Text(
                          'Lokasi Kantor Notaris',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.call,color: Colors.white,),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){
                          //final Uri phoneNumber = Uri.parse('');
                          launch('tel:+6285231611058');

                        },
                        child: Text(
                          '+6285231611058',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),













            /*ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAdmin()));
            }, child: Text('Admin')),*/




          ],
        ),
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

  HakTanggunganScroll(jumlah1,jumlah2,onClick) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=jumlah1; i<jumlah2; i++)
            InkWell(
              onTap: (){
                //print(_allLayanan[i]);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LayananDetail(idx: _allLayanan[i])));

              },
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
                        //'assets/img/ht2.jpg',
                        _allLayanan[i]['foto'],
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
                            '${_allLayanan[i]['layanan']}'
                            ,style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 19
                          ),
                          ),
                          SizedBox(height: 5,),
                          Text("  ${_allLayanan[i]['jenis_layanan']}",
                            style: TextStyle(
                                color: Colors.white54,
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

  HakTanggunganScroll2(jumlah1,jumlah2,onClick) {
    return Row(
      children: [
        for(int i=jumlah1; i<jumlah2; i++)
          InkWell(
            onTap: (){
              //print(_allLayanan[i]);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LayananDetail(idx: _allLayanan[i])));

            },
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 400,
              margin: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(
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
                      'assets/img/kantornotaris.jpg',
                      //_allLayanan[i]['foto'],
                      //height: 180,
                      width: MediaQuery.of(context).size.width*0.8,
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
                          '${_allLayanan[i]['layanan']}'
                          ,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 19
                        ),
                        ),
                        SizedBox(height: 5,),
                        Text("  ${_allLayanan[i]['jenis_layanan']}",
                          style: TextStyle(
                              color: Colors.white54,
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
    );
  }

  Future<void> _buttonUri(String url,
  {bool forceWebView = false, bool enableJavaScript = false}) async {
    await launch(url);
  }




}
