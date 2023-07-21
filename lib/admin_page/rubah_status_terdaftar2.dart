
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monitoringdd/admin_page/rubah_status_terdaftar3.dart';
import 'package:monitoringdd/sub_menu_user/lihat_semua_detail.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/dio.dart';
import '../utils/color.dart';

class RubahStatusTerdaftar2 extends StatefulWidget {
  RubahStatusTerdaftar2({Key? key, required this.idx}) : super(key: key);

  Map idx;

  @override
  State<RubahStatusTerdaftar2> createState() => _RubahStatusTerdaftar2State(this.idx);
}

class _RubahStatusTerdaftar2State extends State<RubahStatusTerdaftar2> {

  late Map idx;
  _RubahStatusTerdaftar2State(this.idx);

  TextEditingController _searchController = TextEditingController();
  final storage = new FlutterSecureStorage();

  late var jsonList;
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

      Dio.Response response = await dio().get('/getuserorder/${idx['id']}',options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));
      //Dio.Response response = await dio().get('/getuserorder/3',options: Dio.Options(headers: {'Authorization' : 'Bearer $token'}));


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



  /////////////////////////////////////////
  void _runFilter(String enteredKeyword) {
    //List<Map<String, dynamic>> results = [];
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = jsonList;
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
                                .push(MaterialPageRoute(builder: (context)=>RubahStatusTerdaftar3(idx: _foundData[index]),));

                            /*Fluttertoast.showToast(
                                msg: '$index',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );*/
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
