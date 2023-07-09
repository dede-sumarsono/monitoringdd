
import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua_detail.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/dio.dart';
import '../utils/color.dart';

class LihatSemua extends StatefulWidget {
  LihatSemua({Key? key, required this.idx}) : super(key: key);

  int idx;

  @override
  State<LihatSemua> createState() => _LihatSemuaState(this.idx);
}

class _LihatSemuaState extends State<LihatSemua> {

  late int idx;
  _LihatSemuaState(this.idx);

  TextEditingController _searchController = TextEditingController();
  final storage = new FlutterSecureStorage();

  late var jsonList;
  //List<Map<String, dynamic>> _foundData = [];
  List<dynamic> _foundData = [];



  @override
  void initState() {
    // TODO: implement initState
    //_foundData = _allData;
    getData();
    super.initState();
  }

  void getData() async {
    try {
      String? token = await storage.read(key: 'token');
      Provider.of<Auth>(context, listen: false).getToken(token: token);

      Dio.Response response = await dio().get('/getuserorder/$idx',options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));
      //Dio.Response response = await dio().get('/getuserorder/3',options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));

      //jsonList = response.data as List;

      if(response.statusCode == 200){
        setState(() {
          jsonList = response.data['data'] as List;
          _foundData = jsonList;
        });
      }else{
        print(response.statusCode);
      }
      print(response);
    } catch (e) {
      print(e);
    }
    //_foundData = _allData;
  }

  final List<Map<String, dynamic>> _allData = [
    {"id": 1, "name": "Andy", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
    {"id": 2, "name": "Aragon", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
    {"id": 3, "name": "Bob", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
    {"id": 4, "name": "Barbara", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
    {"id": 5, "name": "Candy", "jenis_layanan": 'Hak Tanggungan', "proses":"Pendaftaran Baru"},
    {"id": 6, "name": "Colin", "jenis_layanan": 'Hak Tanggungan', "proses":"Pendaftaran Baru"},
    {"id": 7, "name": "Audra", "jenis_layanan": 'Hak Tanggungan', "proses":"Pendaftaran Baru"},
    {"id": 8, "name": "Banana", "jenis_layanan": 'Hak Tanggungan', "proses":"Pendaftaran Baru"},
    {"id": 9, "name": "Caversky", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
    {"id": 10, "name": "Becky", "jenis_layanan": 'Peralihan Hak', "proses":"Pendaftaran Baru"},
  ];


  /////////////////////////////////////////
  void _runFilter(String enteredKeyword) {
    //List<Map<String, dynamic>> results = [];
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allData;
    } else {
      results = _foundData
          .where((user) =>
          user["jenis_pesanan"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundData = results;
    });
  }
  ///////////////////////////////////////



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Daftar Layanan ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'yang Anda Ajukan',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(255, 255, 255, 100),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Cari Data',
                  border: InputBorder.none

                ),
              ),
            ),
            SizedBox(height: 10,),

            Expanded(
              child: ListView.builder(
                //itemCount: jsonList == null ? 0 : jsonList.length,
                  itemCount: _foundData == null ? 0 : _foundData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          title: Text(_foundData[index]['jenis_pesanan']),
                          subtitle: Text('Jenis Layanan : Peralihan Hak'),
                          trailing: Container(
                            width: 75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(_foundData[index]['created_at'].substring(0,10)),
                                //Text(_foundData[index]['status'])
                                //Icon(Icons.arrow_right_outlined),

                              ],

                            ),
                          ),
                          onTap: (){

                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context)=>LihatSemuaDetail(idx: _foundData[index]),));

                            Fluttertoast.showToast(
                                msg: '$index',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            print(_foundData[index].toString());
                          },
                        ));
                  }),
            ),




          ],
        ),


      ),
    );
  }
}
