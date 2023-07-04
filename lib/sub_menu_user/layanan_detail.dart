import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:monitoringdd/widgets/header_container.dart';

import '../utils/color.dart';
import '../utils/textStyle.dart';

class LayananDetail extends StatefulWidget {
  LayananDetail({Key? key, required this.idx}) : super(key: key);
  Map idx;
  //SecondPage({Key key, this.str}): super(key: key);

  @override
  State<LayananDetail> createState() => _LayananDetailState(this.idx);
}

class _LayananDetailState extends State<LayananDetail> {
  _LayananDetailState(this.idx);
  late Map idx;
  //var data = idx['name'];

  List persyaratan = [
    ['Surat Lamaran dan CV','Fotokopi KTP(Penjual dan Pembeli)','Fotokopi KK(Penjual dan Pembeli)','Forokopi Akte Kelahiran ','Fotokopi Ijazah','Fotokopi SKCK','Fotokopi NPWP'],
    ['Surat Pengantar RT/RW','Surat Keterangan Ahli Waris Dari Kelurahan','KTP','KK','Fotokopi Akte Kelahiran Anak','Fotokopi Surat Nikah','Surat Keterangan Kematian','Surat Pernyataan Ahli Waris bermaterai Rp. 10.000'],
    ['Sertifikat Asli dan Foto Copy yang sudah di Cek oleh BPN ( SHM )','Berita Acara Hasil Floting dari BPN ( SHM )','Segel Kepemilikan Tanah sebelum tahun 1960 ( HMA )','Kikitir pajak sebelum tahun 1960 (HMA)','Letter C dilegalisir (HMA)','SPPT PBB Tahun berjalan (lunas) + lunas PBB 5 Tahun sebelumnya','Nota verifikasi harga pasaran  dari Disyanjak','Bukti lunas pembayaran PPh  5%','BPHTB ( NJOP – 60 jt ) x 5 %','Foto Copy KTP dan KK Pemberi Hibah, KTP Persetujuan Suami/Istri,  Surat Nikah   (dilegalisir)','Foto copy KK dan KTP Penerima Hibah ( dilegalisir )','Foto copy KTP 2 (dua) orang saksi (dilegalisir)','Surat Pernyataan Hibah','Daftar Hadir','Surat Pernyataan','Surat Pernyataan Saksi-saksi','Berita Acara peninjauan lokasi  (HMA)'],
    ['Formulir permohonan (Disedikan Notaris)','Surat Kuasa apabila dikuasakan','Fotocopy KTP (2 belah pihak dan para saksi)','Surat Pernyataan Bermaterai Rp. 10.000,-',],
    ['Formulir permohonan (Disedikan Notaris)', 'Surat kuasa apabila dikuasakan','Fotokopi identitas pemohon (KTP,KK) dan kuasa apabila dikuasakan','Fotokopi akta pendirian dan pengesahan badan hukum','Sertifikat Asli', 'Akta Pendirian Usaha','Ijin pemindahan hak','Fotokopi SPPT dan PBB tahun berjalan', 'Penyerahan bukti SSB (BPHTB) dan bukti SSP/PPH untuk perolehan tanah lebih dari 60 Juta Rupiah','NPWP'],
    ['Formulir permohonan','Akta Pendirian Usaha yang merger','KTP Direktur', 'NPWP Direktur', 'NPWP Perusahaan' ],
    ['Surat Hasil Pengadilan','Fotocopy KTP', 'Fotocopy KK' ],
    ['Surat Permohonan Bermaterai','Fotocopy KTP Pihak yang terlihat','Bukti Kepemilikan','Informasi Propert','Surat Kuasa','Surat Perjanjian Lelang','Bukti Pembayaran Uang Muka'],
    ['Surat Permohonan','Fotocopy KTP Pihak yang terlihat','Bukti Kepemilikan','Informasi Aset atau Hak','Surat Kuasa','Perjanjian Pembagian Hak(Bila ada)','Bukti Pembayaran atau Pelunasan(Bila ada)'],


    ['Surat Permohonan (Disedikan Notaris)','Fotocopy KTP Pihak yang terlihat','Bukti Kepemilikan Piutang','Informasi Hak yang Dialihkan','Surat Kuasa','Perjanjian Cessie(Bila ada)',],
    ['Surat Permohonan (Disedikan Notaris)','Fotocopy KTP Pihak yang terlihat','Surat Perjanjian Subrogasi(Disediakan Notaris)','Bukti Pembayaran atau Claim','Informasi Finansial yang dibayarkan atau diclaim',],
    ['Fotocopy KTP','Dokumen sertifikat tanah asli','Dokumen sertifikat hak tanggungan asli'],
    ['Formulir permohonan','Fotocopy KTP','Fotocopy KK','Surat Permohonan Keringanan Biaya', 'Bukti Pewarisan Untuk Kreditor Perorangan', 'Akta Peleburan','Sertipikat Hak Atas Tanah','Fotocopy KTP / Identitas Pemilik Hak','Fotocopy Akta Pendirian dan Pengesahan Badan Hukum','Surat Kuasa Permohonan','Fotocopy/Salinan Surat Bukti Diri Kreditur','Surat Bukti Diri Debitur' ],


    ['Kartu Tanda Penduduk (KTP) calon suami istri, atau suami istri','Kartu Keluarga (KK) calon suami istri, atau suami istri','Kutipan akta perkawinan'],
    ['Bukti identitas berupa KTP orang-orang yang terlibat dalam pendirian CV','Nama dan Alamat CV','Perjanjian Persekutuan','Modal Awal','Struktur Kepemilikan',],
    ['Fotokopi KTP pemilik saham dan pengurus tidak kurang dari dua orang','Fotokopi KK direktur','Fotokopi NPWP direktur atau penanggung jawab perusahaan','Pas foto berwarna direktur','Fotokopi PBB yang terakhir','Apabila lokasi usaha berada di perkampungan, maka diperlukan Surat Keterangan dari RT dan RW','Foto kantor'],
    ['Fotocopy KTP pihak terkait','Merek yang Diberikan','Perjanjian Hibah','Bukti Kepemilikan Merek','Bukti pembayaran biaya hibah(Bila Ada)']
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
                  //SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/ht2.jpg',
                      //height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      ),
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
                    'Layanan ${idx['layanan']}',
                    style: judulTS,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Jenis ${idx['jenis_layanan']}",
                    style: secondaryTS,),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      /*CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/img/person.png'),
                      ),*/
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: orangeColor,
                        child: Icon(
                          Icons.home_repair_service,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text("${idx['layanan']} "
                            ,style: judulTS,maxLines: 3,),
                      ),
                      //Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: orangeColor,
                        child: Icon(
                          Icons.alarm,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("2 Bulan"
                          ,style: secondaryTS),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    //"${idx['layanan']}",
                    "Deskripsi",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  Text(
                    //"aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod",
                    "${idx['deskripsi']}",
                    style: secondaryTS2,

                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Persyaratan",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //itemCount: idx['id'],
                      itemCount: persyaratan[idx['id']].length,
                      itemBuilder: (context,index)=>ingredients(context,index)),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

/*
                  Text(
                    "Langkah - Langkah",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),
*/

                  /*ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index)=>steps(context,index)),
*/



                ],
              ),
            ),
          );
        });
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
          Expanded(
            child: Text(
              //"4 Eggs",
              //"${persyaratan[index]}",
              "${persyaratan[idx['id']][index]}",
              style: judulTS2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

            ),
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





}
