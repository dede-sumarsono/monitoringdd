import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/widgets/btn_widget.dart';
import 'package:monitoringdd/widgets/header_container.dart';

import '../utils/color.dart';
import '../utils/textStyle.dart';

class LihatSemuaDetail extends StatefulWidget {
  LihatSemuaDetail({Key? key, required this.idx}) : super(key: key);
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
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                //child: Image.asset('assets/img/notary.png'),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, orangeLightColor],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/notary.png'),
                    ],
                  ),
                ],
              ),
              buttonArraow(context),
              scroll(),
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


              */ /*Container(
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
              ),*/ /*




            ],
          ),
        )
    );*/
  }

  buttonArraow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black38,
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Cacao Macha Walnut Milk',
                    style: judulTS,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Food .60 min",
                    style: secondaryTS,),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/img/person.png'),
                      ),
                      SizedBox(width: 5,),
                      Text("Elena Shelby"
                          ,style: judulTS),
                      Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: orangeColor,
                        child: Icon(
                          Icons.favorite,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Text("273 Likes"
                          ,style: secondaryTS),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Deskripsi",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  Text(
                    "aliquam id diam maecenas ultricies mi eget mauris pharetra et ultrices neque ornare aenean euismod",
                    style: secondaryTS2,

                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Ingredient",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index)=>ingredients(context)),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 4,
                    ),
                  ),

                  Text(
                    "Langkah - Langkah",
                    style: babTS,
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context,index)=>steps(context,index)),




                ],
              ),
            ),
          );
        });
  }

  ingredients(BuildContext context,) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFACEAD3),
            child: Icon(Icons.done, size: 15,color: Colors.green,),
          ),
          SizedBox(width: 10,),
          Text(
            "4 Eggs",
            style: judulTS2,
          )
        ],
      ),
    );
  }

  steps(BuildContext context,int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black54,
            radius: 12,
            child: Text(
                "${index +1}"
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 270,
                child: Text(
                  "eget magna fermentum iaculis eu non diam phasellus vestibulum lorem",
                  maxLines: 3,
                  style: bodyTS,
                ),
              ),
              SizedBox(height: 10,),
              Image.asset(
                  'assets/img/paris.png',
                  height: 155,
                  width: 270)
            ],
          ),

        ],
      ),
    );
  }
}
