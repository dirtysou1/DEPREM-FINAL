import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:homescreen/Yakinlar.dart';
import 'package:homescreen/values/values.dart';
import 'main.dart';
import 'widgets/potbelly_button.dart';
import 'widgets/spaces.dart';
import 'widgets/spaces.dart';
import 'widgets/spaces.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list, this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'https://www.easyrescuer.com/edit.php';
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'name': firstName.text,
        'phone': phone.text,
        'address': address.text,
      });
    } else {
      var url = 'https://www.easyrescuer.com/add.php';
      http.post(url, body: {
        'userid': finalID.trim(),
        'name': firstName.text,
        'phone': phone.text,
        'address': address.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      firstName.text = widget.list[widget.index]['name'];
      phone.text = widget.list[widget.index]['phone'];
      address.text = widget.list[widget.index]['address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[900],centerTitle: true,
        title: Text(editMode ? 'Kişiyi düzenle' : 'Kişi ekle'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/yakinbg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: ListView(
            children: <Widget>[
              SpaceH96(),
              Center(
                  child: Text(
                editMode ? 'KİŞİ DÜZENLE' : 'KİŞİ EKLE',
                style: TextStyle(color: Colors.white,fontSize: 40),
              )),
              SpaceH40(),
              Center(
                child: new Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: new TextFormField(
                      style: Styles.normalTextStyle,
                      controller: firstName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people_outline_rounded),
                        //labelText: " ",
                        hintText: "Kişinin adı ve soyadı",
                        hintStyle: Styles.customNormalTextStyle(
                            fontSize: 13, color: Colors.white),
                        labelStyle: Styles.customNormalTextStyle(fontSize: 16),
                      )),
                ),
              ),
              Center(
                child: new Container(
                  height: 65,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                  ),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                  child: new TextFormField(
                      style: Styles.normalTextStyle,
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        //labelText: " ",
                        hintText: "Kişinin numarası",
                        hintStyle: Styles.customNormalTextStyle(
                            fontSize: 13, color: Colors.white),
                        labelStyle: Styles.customNormalTextStyle(fontSize: 16),
                      )),
                ),
              ),
              SpaceH30(),

              Container(
                //margin: EdgeInsets.only(left: 100.0, right: 20.0, top: 20),
                child: Center(
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                addUpdateData();
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => MyHomePage()));
                              debugPrint('Clicked RaisedButton Button');
                            },
                            color: Color.fromRGBO(60, 63, 65, 1.0),
                            child: Text(
                              editMode ? 'Değiştir' : 'Kaydet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: FlatButton(
                          onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => MyHomePage()));
                          },
                          color: Color.fromRGBO(60, 63, 65, 1.0),
                          child: Text(
                            "İptal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
