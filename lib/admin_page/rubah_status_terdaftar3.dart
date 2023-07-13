
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:monitoringdd/widgets/header_container.dart';

import '../utils/color.dart';
import '../utils/textStyle.dart';

class RubahStatusTerdaftar3 extends StatefulWidget {
  RubahStatusTerdaftar3({Key? key, required this.idx}) : super(key: key);
  Map idx;
  //SecondPage({Key key, this.str}): super(key: key);

  @override
  State<RubahStatusTerdaftar3> createState() => _RubahStatusTerdaftar3State(this.idx);
}

class _RubahStatusTerdaftar3State extends State<RubahStatusTerdaftar3> {

  _RubahStatusTerdaftar3State(this.idx);
  late Map idx;
  //var data = idx['name'];

  List status = [
    'Pendaftar Baru',
    'Verifikasi Dokumen',
    'Pendaftaran Pajak Oleh Notaris',
    'Pendaftaran Selesai',
    'Proses Real',
    'Proses Pajak',
    'Proses Validasi',
    'Proses Checking',
    'Proses Balik Nama',
    'Proses Peningkatan',
    'Proses HT',
    'Sertifikat Sudah Keluar'
  ];

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

  List rincian_status = [
    'Pada proses ini anda telah terdaftar sebagai pelanggan kami, tunggu sampai proses selanjutnya selesai. Terima kasih kepercayaannya terhadap kami. Akan kami tangani dengan segera ^_^',
    'Pada Proses ini dokumen yang anda berikan sudah kami verifikasi dan sudah sesuai. Selanjutnya adalah proses pendaftaran pajak oleh kami berhubunbgan dengan layanan yang anda ajukan. \n Mohon ditunggu ya dalam prosesnya ^_^ ',
    'Pada proses ini Pajak sudah selesai kami daftarkan, dan proses pedaftaran anda selesai. Tunggu jadwal Real. Nanti anda akan dihubungi oleh pihak dari kami. Terima Kasih ^_^',
    'Pendaftaran anda telah selesai tunggu jadwal Real ya, anda akan dihubungi ketika H-3 dari jadwal Realisasi \n Terima kasih ^_^ ',
    'Jadwal real anda sudah keluar, silahkan lihat pada kolom jadwal real anda dibagian bawah. \n Dimohon kedatangannya tepat waktu ya ^_^',
    'Anda telah melakukan proses real, anda hanya tinggal menunggu dari BPN terkait dokumen yang telah anda ajukan. Kami akan mengurus ke kantor BPN. \n \n Proses selanjutnya adalah pendaftaran pajak, proses spendaftaran pajak ini di estimasikan paling lama 1 bulan. ',
    'Pendaftaran Pajak sudah selesai dilakukan. Berikutnya proses Validasi, Kantor BPN akan memverifikasi dokumen yang anda ajukan, estimasi paling lambat adalah 1 bulan. \n Mohon sabar menunggu kabar baiknya ya ^_^',
    'Proses Validasi sudah selesai dilakukan. Tidak ada dokumen dari anda yang bermasalah. \n Selanjutnya adalah proses checking. ',
    'Proses Checking sudah selesai. Selanjutnya adalah proses balik nama. Proses ini membutuhkan waktu yang cukup lama yaitu 6 bulan mohon untuk ditunggu ya ^_^',
    'Proses Balik Nama sudah selesai. Selanjutnya adalah proses pengingkatan sertifikasi yang anda ajukan. Proses ini memakan waktu sekitar 3 bulan. Silahkan ditunggu kabar baiknya ^_^',
    'Proses Peningkatan sudah selesai, selanjutnya adalah proses HT atau hak tanggungan. Anda sudah membayarkan sesuai dengan ketentuan yang ada. Silahkan ditunggu sekitar 1 minggu lagi.',
    'Proses HT sudah selesai. Sertifikat anda akan segera keluar. Mohon tunggu waktu sekitar 1 bulan ya ^_^',
    'Sertifikat Sudah Keluar, silahkan diambil sertifikatnya ^_^'
  ];

  final itemsList = ['Item 1','Item 2','Item 3','Item 4','Item 5'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                //child: Image.asset('assets/img/notary.png'),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, orangeLightColor],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/notary.png'),
                      //Image.asset('assets/img/${_allLayanan[]['foto']}'),
                    ],
                  ),
                ],
              ),
              buttonArraow(context),
              scroll(),




            ],
          ),
        ));


  }

  buttonArraow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black38,
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Pesanan ${idx['jenis_pesanan']}',
                    style: judulTS,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Jenis Layanan ${idx['jenis_layanan']}",
                    style: secondaryTS,),
                  const SizedBox(height: 15,),
                  Row(
                    children: [

                      CircleAvatar(
                        radius: 25,
                        child: Icon(Icons.person),
                        backgroundColor: orangeColor,
                        //backgroundImage: AssetImage('assets/img/person.png'),
                      ),
                      SizedBox(width: 10,),
                      Text("${idx['username_untuk_user']}"
                          ,style: judulTS),
                      Spacer(),
                      /*CircleAvatar(
                        radius: 25,
                          backgroundColor: orangeColor,
                        child: Icon(
                          Icons.favorite,
                        ),
                      ),*/
                      SizedBox(width: 5,),
                      /*Text("273 Likes"
                          ,style: secondaryTS),*/
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Proses : ${idx['status']}",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  Text(
                    //"aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod",
                    "${rincian_status[0]}",
                    style: secondaryTS2,

                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Deskripsi",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  Text(
                    //"aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod",
                    "${rincian_status[0]}",
                    style: secondaryTS2,

                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  DropdownButton<String>(
                    value: value,
                    iconSize: 36,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                    items: itemsList.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    })

                    ,

                  ),



                  Text(
                    "Status",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: idx['status_number']+1,
                      itemBuilder: (context,index)=>ingredients(context,index)),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (12-(idx['status_number']+1)).toInt(),
                      itemBuilder: (context,index)=>ingredients2(context,index)),



                  SizedBox(height: 10,),

                  /*ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index)=>steps(context,index)),*/




                ],
              ),
            ),
          );
        });
  }


  ingredients2(BuildContext context,int index) {
    //int jumlah = index+(0+(idx['status_number']+1)).toInt();
    int jumlah_asal = 11;
    int jumlah = 11 - (0+(idx['status_number'])).toInt();
    int jumlah_awal = jumlah_asal-jumlah+1+index;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey,
            //backgroundColor: Color(0xFFACEAD3),
            //child: Icon(Icons.cancel , size: 15,color: Colors.red,),
            //child: Icon(Icons.remove , size: 15,color: Colors.red,),
            child: Icon(Icons.remove , size: 15,color: Colors.red,),
          ),
          SizedBox(width: 10,),
          Text(
            //"4 Eggs",
            //"${status[index]}",
            "${status[jumlah_awal]}",
            style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  ingredients(BuildContext context,int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFACEAD3),
            child: Icon(Icons.done, size: 15,color: Colors.green,),
          ),
          SizedBox(width: 10,),
          Text(
            //"4 Eggs",
            "${status[index]}",
            style: judulTS2,
          )
        ],
      ),
    );
  }

  steps(BuildContext context,int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black54,
            radius: 12,
            child: Text(
                "${index +1}"
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "eget magna fermentum iaculis eu non diam phasellus vestibulum lorem",
                  maxLines: 3,
                  style: bodyTS,
                ),
              ),
              SizedBox(height: 10,),
              Image.asset(
                  'assets/img/paris.png',
                  height: 155,
                  width: 270)
            ],
          ),

        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      ),
    );
  }

