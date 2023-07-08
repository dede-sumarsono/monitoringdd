

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monitoringdd/utils/color.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../widgets/header_container.dart';

class RubahLevelUser2 extends StatefulWidget {
  RubahLevelUser2({Key? key, required this.idx}) : super(key: key);

  Map idx;

  @override
  State<RubahLevelUser2> createState() => _RubahLevelUser2State(this.idx);
}

class _RubahLevelUser2State extends State<RubahLevelUser2> {

  late Map idx;


  _RubahLevelUser2State(this.idx);





  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
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
                        getImage(ImageSource.camera);
                      },
                        child: selectedImage == null
                            ? Container(
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
                        ):
                        Container(
                          width: 120,
                          height: 120,
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(selectedImage!),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              color: Color(0xffD6D6D6)),
                        ),
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
                        'Username',idx['username'], Icons.person_outlined),

                    SizedBox(
                      height: 10,
                    ),

                    TextFieldWidget(
                        'E-mail',idx['email'], Icons.mail_outline),

                    const SizedBox(
                      height: 10,
                    ),
                    //TextFieldWidget('No.Telepon',idx['notelepon'], Icons.card_travel),
                    TextFieldWidget('No.Telepon',idx['notelepon'], Icons.call),
                    const SizedBox(
                      height: 10,
                    ),

                    TextFieldWidget('Dibuat pada',idx['created_at'].substring(0,10),
                        Icons.watch_later_outlined),

                    const SizedBox(
                      height: 30,
                    ),



                    ButtonWidget(btnText: 'Rubah User jadi Admin',onClick: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "Peringatan",
                        desc: "Apakah anda yakin akan mengupdate user ${idx['username']} menjadi Admin? ",
                        btnCancelOnPress: (){},
                        btnOkOnPress: (){
                          Provider.of<Auth>(context,listen: false)
                              .userToAdmin(id: idx['id']);
                        },
                      ).show();

                    },),

                    const SizedBox(
                      height: 30,
                    ),

                    ButtonWidget(btnText: 'Hapus User',onClick: () {
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
                              .deleteUser(id: idx['id']);
                        },
                      ).show();




                    },),

                    SizedBox(height: 30,)





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
