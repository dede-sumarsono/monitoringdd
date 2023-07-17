
import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monitoringdd/screens/home_screen_navbar.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/utils/color.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/dio.dart';
import '../widgets/header_container.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {




  final storage = new FlutterSecureStorage();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  var _tooken;


  ///////////////////////tidak bisa
  getImage(ImageSource source, int iduser) async {
    //requestPermission();

    String? token = await storage.read(key: 'token');
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      String jejak = image.path.toString();
      String fileName = image.path.split('/').last;
      //String path = image.path.split('/').last.;
      String dir = jejak.substring(0,jejak.lastIndexOf(fileName));
      print(fileName);
      print(dir);

      FormData data = FormData.fromMap({
        //'avatar': MultipartFile.fromFile(image.path)
        'avatar': await MultipartFile.fromFile(dir,filename: fileName)
      });


      Dio.Response response = await dio().post('/updatefoto/$iduser',
          data: data,
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}),
          /*onSendProgress: (int sent, int total) {

            if(sent == total){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Data Terkirim"),
              ));

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreenNavBar()));
            }
            print('$sent $total');
          }*/
          );
      print(response);




      //uploadfile(selectedImage!, image.path, iduser, token);




    }
  }
  ///////////////////////tidak bisa

  uploadFile(int userid) async {
    String? token = await storage.read(key: 'token');

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result!=null){
      File file = File(result.files.single.path ?? " ");

      String filename = file.path.split('/').last;
      String filepath = file.path;


      FormData data = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(filepath,filename: filename)
      });


      Dio.Response response = await dio().post('/updatefoto/$userid',
        data: data,
        options: Dio.Options(headers: {'Authorization': 'Bearer $token'}),
        /*onSendProgress: (int sent, int total) {

            if(sent == total){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Data Terkirim"),
              ));

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreenNavBar()));
            }
            print('$sent $total');
          }*/
      );
      print(response);



    }else{
      print('result is null');
    }


  }

  requestPermission() async {
    var status = await Permission.storage.status;
    print(status);
    if(!status.isGranted){
      await Permission.storage.request();
    }

    var status1 = await Permission.manageExternalStorage.status;
    print(status1);
    if(!status.isGranted){
      await Permission.manageExternalStorage.request();
    }



  }

  /*Future<String> uploadImage(File file) async {

    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    response = await dio.post("/info", data: formData);
  }*/

  uploadfile (File data,lokasi,iduser,token) async {
    String fileName = lokasi.path.split('/').last;
    print(' filenamenya : $fileName');

    FormData data = FormData.fromMap({
      //'avatar': MultipartFile.fromFile(image.path)
      'avatar': await MultipartFile.fromFile(lokasi,filename: fileName)
    });

    /*Dio.Response response = await dio().post('/updatefoto/$iduser',
        data: data,
        options: Dio.Options(headers: {'Authorization': 'Bearer $token'}),
        onSendProgress: (int sent, int total) {

          if(sent == total){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Data Terkirim"),
            ));

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreenNavBar()));
          }
          print('$sent $total');


        });
    print(response.toString());*/
  }

  getToken()async{
    String? token = await storage.read(key: 'token');

    setState(() {
      _tooken = token;
    });
  }




  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    requestPermission();
    getToken();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<Auth>(context);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    //Widget greenIntroWidgetWithoutLogos(),
                    greenIntroWidgetWithoutLogos(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          //getImage(ImageSource.camera);
                        },
                        //child: selectedImage == null
                        child:
                            _tooken == null ? CircularProgressIndicator():

                        Container(
                          width: 120,
                          height: 120,
                          /*child: Icon(Icons.camera_alt_outlined,size: 40,
                            color: Colors.white,),*/
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                //image: FileImage(selectedImage!),
                                  image: NetworkImage(
                                      "http://10.0.2.2/monitoringdd/public/api/downloadAvatar"
                                          ,headers: {'accept':'Application/Json','Authorization' : 'Bearer $_tooken'}
                                          //,headers: {'accept':'Application/Json','Authorization' : 'Bearer $_tooken',"Content-type":"multipart/form-data"}

                                  ),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: Color(0xffD6D6D6)),
                        )


                         /*imagedb==null ? CircularProgressIndicator():
                            Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffD6D6D6)),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        )*/




                        /*:Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  //image: FileImage(selectedImage!),
                                  image: FileImage(imagedb!),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              color: Color(0xffD6D6D6)),
                        ),*/
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Form(
                  key: formKey,
                  child: Column(

                    children: [
                      TextFieldWidget(
                          'Username',userdata.user!.username, Icons.person_outlined),

                      SizedBox(
                        height: 10,
                      ),

                      TextFieldWidget(
                          'E-mail',userdata.user!.email, Icons.mail_outline),

                      const SizedBox(
                        height: 10,
                      ),
                      //TextFieldWidget('No.Telepon',idx['notelepon'], Icons.card_travel),
                      TextFieldWidget('No.Telepon',userdata.user!.notelepon, Icons.call),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFieldWidget('Dibuat pada',userdata.user!.created_at.substring(0,10),
                          Icons.watch_later_outlined),

                      const SizedBox(
                        height: 30,
                      ),

                      ButtonWidget(btnText: 'Update Image',onClick: () {
                       //userdata.user!.username

                        //getImage(ImageSource.camera, userdata.user!.id);
                        //getImage(ImageSource.camera, userdata.user!.id);
                        uploadFile(userdata.user!.id);



                      },),

                      SizedBox(height: 15,),

                      ButtonWidget(btnText: 'Log Out',onClick: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Peringatan",
                          desc: "Apakah anda yakin akan keluar ? ",
                          btnCancelOnPress: (){},
                          btnOkOnPress: (){
                            Provider.of<Auth>(context,listen: false)
                                .logout();
                            Route route = MaterialPageRoute(builder: (context) => LoginScreen());
                            Navigator.pushReplacement(context, route);
                          },
                        ).show();

                      },),

                      const SizedBox(
                        height: 10,
                      ),

                      /*ButtonWidget(btnText: 'Hapus User',onClick: () {
                        print('Button hapus clicked');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.topSlide,
                          showCloseIcon: true,
                          title: "Peringatan",
                          desc: "Akun ini akan dihapus",
                          btnCancelOnPress: (){},
                          btnOkOnPress: (){
                            Provider.of<Auth>(context,listen: false)
                                .userToAdmin(id: idx['id']);
                          },
                        ).show(); },),*/






                      SizedBox(height: 20,)





                    ],

                  ),

                ),
              ),







            ],
          ),
        )

    );




  }

  Widget greenIntroWidgetWithoutLogos({String title = "Profile Settings", String? subtitle}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/mask2.png'),
              fit: BoxFit.fill
          )
      ),
      height: MediaQuery.of(context).size.height*0.3,
      child: Container(
          height: MediaQuery.of(context).size.height*0.1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
              if(subtitle != null) Text(subtitle,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),

            ],
          )),



    );

  }

  TextFieldWidget(String title,String isian, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  //color: Colors.black.withOpacity(0.05),
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(iconData, color: orangeColor,),
              ),
              Text(isian,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ],
          ),




        )
      ],
    );


  }






}
