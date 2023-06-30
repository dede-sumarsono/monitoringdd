
import 'package:flutter/material.dart';

import '../utils/color.dart';

class ButtonWidget extends StatelessWidget {
  //const ButtonWidget({Key? key}) : super(key: key);

  var btnText = "";
  var onClick;


  ButtonWidget({required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
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
        child: Text(btnText,style:
        TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)
          ,),
      ),
    );
  }
}
