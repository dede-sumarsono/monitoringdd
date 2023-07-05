

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';
import '../widgets/header_container.dart';

class PostDataUser extends StatefulWidget {
  const PostDataUser({Key? key}) : super(key: key);

  @override
  State<PostDataUser> createState() => _PostDataUserState();
}

class _PostDataUserState extends State<PostDataUser> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nomorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


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
                        margin: EdgeInsets.only(left: 20,right: 20,top: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:<Widget>[
                            _textInput(hint: "Nama User",icon: Icons.email,controller: _emailController,validVar: 'Tolong isi email yang sesuai'),
                            _textInput(hint: "Username",icon: Icons.person,controller: _usernameController,validVar: 'Tolong isi username yang sesuai'),
                            _textInput(hint: "Jenis Layanan",icon: Icons.vpn_key,controller: _passwordController,validVar: 'Tolong isi password yang sesuai'),
                            _textInput(hint: "Jenis Pesanan",icon: Icons.call,controller: _nomorController,validVar: 'Tolong isi nomor telepon yang sesuai'),
                            _textInput(hint: "Keterangan",icon: Icons.call,controller: _nomorController,validVar: 'Tolong isi nomor telepon yang sesuai'),


                            Expanded(
                              child: Center(
                                child: ButtonWidget(
                                  btnText: 'Registrasi',
                                  onClick: (){
                                    Map creds = {
                                      'email' : _emailController.text,
                                      'password' : _passwordController.text,
                                      'username' : _usernameController.text,
                                      'notelepon' : _nomorController.text

                                    };

                                    if(_formKey.currentState!.validate()){
                                      Provider.of<Auth>(context,listen: false)
                                          .register(creds: creds);
                                      Navigator.pop(context);
                                    }


                                  }

                                  ,

                                ),

                              ),
                            ),
                            RichText(
                                text:TextSpan(
                                    children:
                                    [
                                      TextSpan(
                                          text: "Ingin Login ? ",
                                          style: TextStyle(color: Colors.black)
                                      ),
                                      TextSpan(
                                          text: " Sudah punya akun",
                                          style: TextStyle(color: orangeColor),
                                          recognizer: TapGestureRecognizer()..onTap = () {
                                            Navigator.pop(context);
                                          }
                                      ),
                                    ]
                                )
                            )






                            /*Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10)
                              ),
                              child: Text("Log in"),
                              onPressed: (){

                                Map creds = {
                                  'email' : _emailController.text,
                                  'password' : _passwordController.text,

                                };

                                if(_formKey.currentState!.validate()){
                                  Provider.of<Auth>(context,listen: false)
                                      .login(creds: creds);
                                  Navigator.pop(context);
                                }
                              },

                            ),
                          ),
                        )*/







                          ],)
                    ),
                  )

              ),


            ],
          ),
        )





    );
  }


  ////////////////
  Widget _textInput({controller, hint, icon,validVar}){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          //hintText: "Email",
          hintText: hint,
          //prefixIcon: Icon(Icons.email),
          prefixIcon: Icon(icon),

        ),
        //controller: _emailController,
        controller: controller,
        //validator: (value) => value!.isEmpty ? 'Tolong isi email yang sesuai' : null,
        validator: (value) => value!.isEmpty ? validVar : null,
      ),
    );
  }
}
