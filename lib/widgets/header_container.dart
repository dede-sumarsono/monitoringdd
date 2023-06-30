import 'package:flutter/material.dart';

import '../utils/color.dart';

class HeaderContainer extends StatelessWidget {
  //const HeaderContainer({Key? key}) : super(key: key);

  var text = "";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [orangeColor, orangeLightColor],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
              right: 20,
              child: Text(
            text,
            style: TextStyle(color: Colors.white,fontSize: 20),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/notary.png',
                  scale: 1.5,
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Notary Monitor",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
