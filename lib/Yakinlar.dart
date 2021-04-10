import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:homescreen/AddEditPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Butonlar.dart';
import 'main.dart';
import 'widgets/potbelly_button.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future addData() async{
    var url = 'https://www.easyrescuer.com/read.php';
    var response = await http.post(Uri.parse(url),
        body: {
          "userid": finalID.toString().trim(),


        }
    );
    return jsonDecode(response.body);

  }


  Future getData()async{

    var url = 'https://www.easyrescuer.com/read.php';
    var response = await http.get(url);
    return json.decode(response.body);

  }


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[900],
        title: Text('Yakınlarım'),centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber[900],
        child: Icon(Icons.add,size: 50,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/backg.png"),
          fit: BoxFit.cover,
        ),
      ),
        child: FutureBuilder(
          future: addData(),
          builder: (context,snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  List list = snapshot.data;

                  return Center(
                    child: Container(height: 65,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 50,
                      ),
                      margin: EdgeInsets.only(left: 10.0, right: 10.0,top: 20),
                      child: ListTile(
                        leading: GestureDetector(child: Icon(Icons.edit),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(list: list,index: index,),),);
                            debugPrint('Düzenleme etkin');
                          },),
                        title: Text(list[index]['name']),
                        subtitle: Text(list[index]['phone']),
                        trailing: GestureDetector(child: Icon(Icons.delete),
                          onTap: (){
                            setState(() {
                              var url = 'https://www.easyrescuer.com/delete.php';
                              http.post(url,body: {
                                'id' : list[index]['id'],
                              });
                            });
                            debugPrint('Silindi');
                          },),



                      ),
                    ),
                  );
                }
            )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}