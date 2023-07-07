
import 'dart:convert';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/admin_page/post_data_user.dart';
import 'package:monitoringdd/admin_page/post_data_user2.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua_detail.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/dio.dart';
import '../utils/color.dart';

class PickUser extends StatefulWidget {
  //const LihatSemua({Key? key}) : super(key: key);


  @override
  State<PickUser> createState() => _PickUserState();
}

class _PickUserState extends State<PickUser> {

  TextEditingController _searchController = TextEditingController();
  final storage = new FlutterSecureStorage();
  late var jsonList;
  List<dynamic> _foundData = [];

  @override
  void initState() {
    // TODO: implement initState
    readToken();
    //Provider.of<Auth>(context, listen: false).getalluser();
    //_foundData = _allData;
    super.initState();
  }

  void readToken() async {
    String? token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).getToken(token: token);
    print(token);

    Dio.Response response = await dio().get('/getalluser',options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));
    print(response.data.toString());

    if(response.statusCode == 200){
      setState(() {
        jsonList = response.data['data'] as List;
        _foundData = jsonList;
      });
    }else{
      print(response.statusCode);
    }


  }

  /*final List<Map<String, dynamic>> _allData = [
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
  ];*/


  //List<Map<String, dynamic>> _foundData = [];

  /////////////////////////////////////////
  void _runFilter(String enteredKeyword) {
    //List<Map<String, dynamic>> results = [];
    //List<Map<String, dynamic>> results = [];
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = jsonList;
    } else {
      results = _foundData
          .where((username) =>
          username['username'].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    // Refresh the UI
    setState(() {


      _foundData = results;
    });
  }

  _runFilter2(String enteredKeyword) {
    List<dynamic> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = jsonList;
    } else {
      results = _foundData
          .where((user) =>
          user["username"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive

    }
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
              'Pilih Nama User ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'yang ingin anda tambahkan',
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
                //onChanged: (value) => _runFilter2(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Cari Nama',
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
                          title: Text(_foundData[index]['username']),
                          subtitle: Text('Jenis Layanan : Peralihan Hak'),
                          trailing: Container(
                            width: 75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('2023-04-05'),
                                //Icon(Icons.arrow_right_outlined),

                              ],

                            ),
                          ),
                          onTap: (){

                            Navigator.of(context)
                                //.push(MaterialPageRoute(builder: (context)=>PostDataUser(idx: _foundData[index]),));
                                .push(MaterialPageRoute(builder: (context)=>PostDataUser2(idx: _foundData[index]),));

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
