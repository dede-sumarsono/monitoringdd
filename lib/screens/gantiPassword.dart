

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/register_screen.dart';
import 'package:monitoringdd/screens/splashscreen.dart';
import 'package:monitoringdd/widgets/header_container.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({Key? key}) : super(key: key);

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordBaruController = TextEditingController();
  TextEditingController _passwordBaruKonfirmasiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    //_emailController.text = 'dede@gmail.com';
    //_passwordController.text = 'rahasia';
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordBaruController.dispose();
    _passwordBaruKonfirmasiController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              HeaderContainer("Ganti Password"),
              Form(
                  key: _formKey,
                  child: Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children:<Widget>[
                            _textInput(hint: "Password Lama",icon: Icons.vpn_key,controller: _passwordController,validVar: 'Tolong isi password yang sesuai',obse: true),
                            _textInput(hint: "Password Baru",icon: Icons.vpn_key,controller: _passwordBaruController,validVar: 'Tolong isi password yang sesuai',obse: true),
                            _textInput(hint: "Konfirmasi Password Baru",icon: Icons.vpn_key,controller: _passwordBaruKonfirmasiController,validVar: 'Tolong isi password yang sesuai',obse: true),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerRight,
                              child: Text('Masukan password yang baru',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),

                            Expanded(
                              child: Center(
                                child: InkWell(
                                  onTap: (){

                                    Map creds = {
                                      'old_password' : _passwordController.text,
                                      'new_password' : _passwordBaruController.text,
                                      'new_password_confirmation' : _passwordBaruKonfirmasiController.text,

                                    };

                                    if(_formKey.currentState!.validate()){
                                      Provider.of<Auth>(context,listen: false)
                                          .rubahPassword(creds: creds);
                                      //Navigator.pop(context);
                                      //Route route = MaterialPageRoute(builder: (context) => HomeScreen());
                                      Route route = MaterialPageRoute(builder: (context) => SplashScreen());
                                      Navigator.pushReplacement(context, route);
                                    }

                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [ orangeColor, orangeLightColor],
                                        end: Alignment.centerLeft,
                                        begin: Alignment.centerRight,),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text("Rubah Password",style:
                                    TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)
                                      ,),
                                  ),
                                ),
                              ),
                            ),
                            /*RichText(
                                text:TextSpan(
                                    children:
                                    [
                                      TextSpan(
                                          text: "Belum punya akun ? ",
                                          style: TextStyle(color: Colors.black)
                                      ),
                                      TextSpan(
                                          text: " Register sekarang",
                                          style: TextStyle(color: orangeColor),
                                          recognizer: TapGestureRecognizer()..onTap = (){
                                            Navigator.pop(context);
                                          }

                                      ),
                                    ]
                                )
                            )*/






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
  Widget _textInput({controller, hint, icon,validVar,obse}){
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: obse,
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
