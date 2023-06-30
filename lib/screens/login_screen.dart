

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/register_screen.dart';
import 'package:monitoringdd/widgets/header_container.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../utils/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = 'dede@gmail.com';
    _passwordController.text = 'rahasia';
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Form(
                key: _formKey,
                child: Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20,top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                    children:<Widget>[
                        _textInput(hint: "Email",icon: Icons.email,controller: _emailController,validVar: 'Tolong isi email yang sesuai'),
                        _textInput(hint: "Password",icon: Icons.vpn_key,controller: _passwordController,validVar: 'Tolong isi password yang sesuai'),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Lupa Password ?',
                          ),
                        ),

                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: (){

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
                              child: Text("Login",style:
                                TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)
                                ,),
                            ),
                          ),
                        ),
                      ),
                      RichText(
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
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



      /*Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) => value!.isEmpty ? 'Tolong isi email yang sesuai' : null,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) => value!.isEmpty ? 'Tolong isi password yang sesuai' : null,
              ),
              ElevatedButton(
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

              )
            ],
          )

      ),*/










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
