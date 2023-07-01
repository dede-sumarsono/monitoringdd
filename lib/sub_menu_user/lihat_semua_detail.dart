

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:monitoringdd/widgets/header_container.dart';

import '../utils/color.dart';

class LihatSemuaDetail extends StatefulWidget {
  LihatSemuaDetail({Key? key,required this.idx}) : super(key: key);
  Map idx;
  //SecondPage({Key key, this.str}): super(key: key);

  @override
  State<LihatSemuaDetail> createState() => _LihatSemuaDetailState(this.idx);
  }

class _LihatSemuaDetailState extends State<LihatSemuaDetail> {
  _LihatSemuaDetailState(this.idx);
  late Map idx;
  //var data = idx['name'];

  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     body: Stack(
       children: [
         Container(
           width: double.infinity,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Colors.deepOrange, orangeLightColor],
               end: Alignment.bottomCenter,
               begin: Alignment.topCenter,
             ),
           ),
         ),
         buttonArraow(context),
         //scroll()
       ],
     ),
   ));
    
    /*return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, orangeLightColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(300),
                      bottomRight: Radius.circular(300),
                    )),
                child: Center(child: Image.asset('assets/img/notary.png')),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Book your flight',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(64, 147, 206, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'One way',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(215, 234, 248, 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Round Trip',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                    )
                    )
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              scroll(),


              *//*Container(
                padding: EdgeInsets.all(10),
                width: 308,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Atas Nama'),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(224, 237, 246, 100),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('To'),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(224, 237, 246, 100),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Date'),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Color.fromRGBO(224, 237, 246, 100),
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(btnText: 'Kembali')
                  ],
                ),
              ),*//*




            ],
          ),
        )
    );*/
    
    
    
  }

  buttonArraow( BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25)
        ),
        child: IconButton(
          onPressed: (){Navigator.pop(context);},
          icon:Icon(Icons.arrow_back_ios),
          color: Colors.white,

        ),
      ),
    );
  }
  


}
