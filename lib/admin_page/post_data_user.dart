import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/screens/register_screen.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';
import '../widgets/header_container.dart';

class PostDataUser extends StatefulWidget {
  PostDataUser({Key? key, required this.idx,required this.username, required this.iduser}) : super(key: key);

  Map idx;
  String username;
  int iduser;

  @override
  State<PostDataUser> createState() => _PostDataUserState(this.idx, this.username,this.iduser);
}

class _PostDataUserState extends State<PostDataUser> {
  late Map idx;
  late String username;
  late int iduser;

  _PostDataUserState(this.idx,this.username,this.iduser);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _jenislayanan = TextEditingController();
  TextEditingController _jenispesanan = TextEditingController();
  TextEditingController _keterangan = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool dp = false;
  String? selectedValue;
  String? selectedValue2;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          HeaderContainer("Post Data User"),
          Form(
              key: _formKey,
              child: Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: ListView(
                      children: <Widget>[
                        textConst('$username',Icons.person,'Nama User'),
                        SizedBox(height: 5,),
                        textConst('${idx['jenis_layanan']}',Icons.work_history,'Jenis Layanan'),
                        SizedBox(height: 5,),
                        textConst('${idx['layanan']}',Icons.work,'Jenis Pesanan'),
                        _textInput(hint: "Keterangan",icon: Icons.description, controller: _keterangan, validVar: 'Tolong isi nomor keterangan yang sesuai'),


                  SizedBox(
                    height: 10,
                  ),
                  /*Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.work,
                        color: orangeColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Jenis Layanan",
                        style: TextStyle(
                            color: orangeColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),*/






                        /////////////////////////////////////// Template Jenis Layanan
                        /*DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [orangeColor, orangeLightColor],
                                  end: Alignment.centerLeft,
                                  begin: Alignment.centerRight),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.57), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: DropdownButton<String?>(
                              value: selectedValue,
                              items: [
                                "Peralihan Hak",
                                "Hak Tanggungan",
                                "Layanan Notaris"
                              ]
                                  .map<DropdownMenuItem<String?>>(
                                      (e) => DropdownMenuItem(
                                            child: Text(e.toString()),
                                            value: e,
                                          ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                  print(selectedValue);
                                });
                              },
                              underline: SizedBox(),
                              isExpanded: true,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              dropdownColor: Colors.green,
                              iconEnabledColor: Colors.white,
                            ),
                          ),
                        ),*/





                        /*SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.work,
                              color: orangeColor,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Jenis Pesanan",
                              style: TextStyle(
                                  color: orangeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),*/




                        //SizedBox(height: 10,),
                        /*Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: DropdownButton<String?>(
                                  value: selectedValue2,
                                  items: selectedValue == null ? ["Tidak ada","Yang","Ditampilkan"]
                                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(child: Text(e.toString()),value: e,)).toList() :
                                      ["Buah","Buahaha","Haha"]
                                      .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(child: Text(e.toString()),value: e,)).toList() ,


                                  onChanged: (value){
                                    setState(() {
                                      selectedValue2 = value;
                                      print(selectedValue2);
                                    });
                                  },
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                  dropdownColor: Colors.green,
                                  iconEnabledColor: Colors.white,
                                  ),
                            ),*/



                        /////////////////////////////////////// Template
                        /*DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [orangeColor, orangeLightColor],
                                  end: Alignment.centerLeft,
                                  begin: Alignment.centerRight),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.57), //shadow for button
                                    blurRadius: 5) //blur radius of shadow
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: DropdownButton<String?>(
                              value: selectedValue2,
                              items: selectedValue == null
                                  ? ["Tidak ada"]
                                      .map<DropdownMenuItem<String?>>(
                                          (e) => DropdownMenuItem(
                                                child: Text(e.toString()),
                                                value: e,
                                              ))
                                      .toList()
                                  : ["Buah", "Buahaha", "Haha"]
                                      .map<DropdownMenuItem<String?>>(
                                          (e) => DropdownMenuItem(
                                                child: Text(e.toString()),
                                                value: e,
                                              ))
                                      .toList(),

                                onChanged: (value) {
                                setState(() {
                                  selectedValue2 = value;
                                  print(selectedValue2);
                                })
                                ;

                              },
                              underline: SizedBox(),
                              isExpanded: true,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              dropdownColor: Colors.green,
                              iconEnabledColor: Colors.white,
                            ),
                          ),
                        ),*/

                        /////////////////////////////////////// Template

                        SizedBox(
                          height: 20,
                        ),

                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              btnText: 'Daftarkan',
                              onClick: () {
                                Map creds = {
                                  /*'email' : _emailController.text,
                                      'password' : _passwordController.text,
                                      'username' : _usernameController.text,
                                      'notelepon' : _nomorController.text*/
                                  "id_untuk_user": iduser,
                                  "jenis_layanan": idx['layanan'],
                                  "jenis_pesanan": idx['jenis_layanan'],
                                  "keterangan": _keterangan.text
                                };

                                if (_formKey.currentState!.validate()) {
                                  Provider.of<Auth>(context,listen: false)
                                          .postDataUser(creds: creds);
                                      Navigator.pop(context);
                                  print(creds);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
              )),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Akun User belum terdaftar ? ",
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: " Daftarkan akun suer",
                style: TextStyle(color: orangeColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  }),
          ])),



        ],
      ),
    ));
  }

  Widget textConst(nama,icon,des) {
    //return Text("Nama User : $nama");
    return Container(
      margin: EdgeInsets.only(left: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon,color: orangeColor,),
          SizedBox(width: 5,),
          Text(
            " $des",
            //style: TextStyle(color: Colors.black87, fontSize: 16),
              style: TextStyle(
                  color: orangeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            " : ",
            //style: TextStyle(color: Colors.black87, fontSize: 16),
              style: TextStyle(
                  color: orangeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              "$nama",
              //style: TextStyle(color: Colors.black87, fontSize: 16),
                style: TextStyle(
                    color: orangeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  ////////////////
  Widget _textInput({controller, hint, icon, validVar}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        style: TextStyle(color: orangeColor),
        decoration: InputDecoration(

          border: InputBorder.none,
          //hintText: "Email",
          hintText: hint,
          //prefixIcon: Icon(Icons.email),
          prefixIcon: Icon(icon,color: orangeColor,),
        ),
        //controller: _emailController,
        controller: controller,
        //validator: (value) => value!.isEmpty ? 'Tolong isi email yang sesuai' : null,
        validator: (value) => value!.isEmpty ? validVar : null,
      ),
    );
  }
}
