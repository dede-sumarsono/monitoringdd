
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/sub_menu_user/layanan_detail.dart';
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


  /*List _listLayanan = [
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

  ];*/

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
                  HakTanggunganScroll(0,9,(){}),//untuk peralihan hak
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
                  HakTanggunganScroll(9,13,(){}),//Untuk Hak Tanggungan
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
                  HakTanggunganScroll(13,17,(){}),//Layanan Notaris


                ],
              ),
            )


          ],
        ),
      )

    );
  }



  HakTanggunganScroll(jumlah1,jumlah2,onClick) {
    //jumlah2++;
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


}
