

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

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
      body: Form(
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

      ),
    );
  }
}
